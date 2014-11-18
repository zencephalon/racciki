class Wiki < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
end