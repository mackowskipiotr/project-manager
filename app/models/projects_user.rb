class ProjectsUser < ApplicationRecord
	belongs_to :invited, class_name: "Project", foreign_key: "project_id"
	belongs_to :invitation, class_name: "User", foreign_key: "user_id"
end