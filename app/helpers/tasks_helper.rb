module TasksHelper

	def done_button(task)
		if task.done
			link_to "Powrót do zadania", project_task_done_path(task.project, task), class: "btn btn-warning", method: :patch
		else
			link_to "Zakończ zadanie", project_task_done_path(task.project, task), class: "btn btn-success", method: :patch
		end	 
	end

	def done_label(task)
		if task.done
			content_tag(:span, "Zakończone", class: "label label-success")
		else
			content_tag(:span, "W toku", class: "label label-warning")		
		end	 
	end

end
