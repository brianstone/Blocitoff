Rails.application.routes.draw do
   
  get 'my/profile', to: 'users#show'

  get 'home/index'

  devise_for :users
    
  resources :users, only: [:update, :show] do
    resources :items, only: [:create, :destroy]
  end
  
  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end

  unauthenticated :user do
    root to: 'home#index'
  end

end
