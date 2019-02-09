class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects
    @projects_invited = current_user.invited
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @is_invited = ProjectsUser.find_by(project_id: @project.id, user_id: current_user.id)
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user = current_user

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Projekt został stworzony.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Projekt został zaktualizowany.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Projekt został usunięty.' }
      format.json { head :no_content }
    end
  end

  def join
    @project = Project.find(params[:project_id])
    project_user = ProjectsUser.find_by(project_id: @project.id, user_id: current_user.id)

    if !project_user.blank?
      project_user.delete
      redirect_to @project, notice: 'Zostałeś usunięty z projektu.' 
    else
      project_user = ProjectsUser.new({
        project_id: @project.id,
        user_id: current_user.id
      })

      if project_user.save
        redirect_to @project, notice: 'Zostałeś dodany do projektu.' 
      else
        redirect_to @project, alert: 'Nie zostałeś dodany do projektu.' 
      end
    end

   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name)
    end
end
