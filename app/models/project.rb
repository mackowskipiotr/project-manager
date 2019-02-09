class Project < ApplicationRecord
  belongs_to :user
  has_many :projects_users
  has_many :invitation, through: :projects_users, class_name: "User", foreign_key: "user_id"
end
