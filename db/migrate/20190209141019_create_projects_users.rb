class CreateProjectsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :projects_users do |t|
    	t.references :project
    	t.references :user
    	t.timestamps

    	t.index [:project_id, :user_id]
    end
  end
end
