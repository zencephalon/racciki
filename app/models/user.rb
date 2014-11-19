class User < ActiveRecord::Base
  has_secure_password

  has_many :contributions
  # Remember to create a migration!
  has_many :contributed_wikis, through: :contributions, class_name: "Wiki", source: :wiki
end
