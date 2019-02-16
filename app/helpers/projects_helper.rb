module ProjectsHelper

	def join_button
		if @project.user != current_user
			if !@is_invited
				link_to "Dołącz", project_join_path(@project), class: "btn btn-success btn-join", method: :post
			else
				link_to "Opuść", project_join_path(@project), class: "btn btn-danger btn-join", method: :post
			end	 
		end
	end
end
