module ProjectsHelper

	def join_button
		if @project.user != current_user
			if !@is_invited
				link_to "Dołącz", project_join_path(@project), class: "btn btn-success", method: :post
			else
				link_to "Opuść", project_join_path(@project), class: "btn btn-danger", method: :post
			end	 
		end
	end
end
