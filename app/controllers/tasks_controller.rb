class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:new, :create, :edit, :update, :destroy, :done]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :project_users, only: [:new, :edit]

  # GET /projects/1/tasks/1
  # GET /projects/1/tasks/1.json
  def show
  end

  # GET /projects/1/tasks/new
  def new
    @task = Task.new
  end

  # GET /projects/1/tasks/1/edit
  def edit
  end

  # POST /projects/1/tasks
  # POST /projects/1/tasks.json
  def create
    @task = Task.new(task_params)
    @task.project = @project

    respond_to do |format|
      if @task.save
        format.html { redirect_to @project, notice: 'Zadanie zostało stworzone.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1/tasks/1
  # PATCH/PUT /projects/1/tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @project, notice: 'Zadanie zostało zaktualizowane.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1/tasks/1
  # DELETE /projects/1/tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Zadanie zostało usunięte.' }
      format.json { head :no_content }
    end
  end

  def done
    @task = Task.find(params[:task_id])

    if @task.update(done: !@task.done)
      redirect_to @project, notice: 'Zadanie zostało zaktualizowane.'
    else
      redirect_to @project, alert: 'Zadanie nie zostało zaktualizowane.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :user_id, :done)
    end

    def project_users
      @project_users = @project.invitation.to_a
      @project_users.push(@project.user)
    end
end
