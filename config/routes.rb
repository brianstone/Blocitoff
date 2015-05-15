Rails.application.routes.draw do
   
  get 'my/profile', to: 'users#show'

  get 'home/index'

  devise_for :users
   root to: 'home#index'
end
