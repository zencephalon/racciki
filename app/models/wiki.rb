class Wiki < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  has_many :contributions

  has_many :revisions
  #has_many :users, through: :contributions, class_name: "User", source: :user
  has_many :contributers, through: :contributions, class_name: "User", source: :user
  # has_many :contributers, through: :contributions, class_name: "Contributer", source: :contributer

  # has_many :subscriptions
  # has_many :users, through: :subscriptions
  def create_revision(content)
    self.revision_id += 1
    self.revisions.create(content: content, revision_id: self.revision_id)
    self.save
  end

  def current_revision
    self.revisions.find_by(revision_id: self.revision_id)
  end
end