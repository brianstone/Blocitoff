class Item < ActiveRecord::Base
  belongs_to :user

  validates :task, presence: true

  default_scope { order('updated_at DESC') }
end
