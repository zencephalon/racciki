class Wiki < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true

  has_many :contributions
  #has_many :users, through: :contributions, class_name: "User", source: :user
  has_many :contributers, through: :contributions, class_name: "User", source: :user
  # has_many :contributers, through: :contributions, class_name: "Contributer", source: :contributer

  # has_many :subscriptions
  # has_many :users, through: :subscriptions
end