class Item < ActiveRecord::Base
  belongs_to :user

  validates :task, presence: true

  default_scope { order('updated_at DESC') }

  def days_left
    (created_at.to_date - 7.days.ago.to_date).to_i
  end
end
