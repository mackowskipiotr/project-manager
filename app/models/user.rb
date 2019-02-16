class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :projects_users
  has_many :invited, through: :projects_users, class_name: "Project", foreign_key: "project_id"
  has_many :tasks
end
