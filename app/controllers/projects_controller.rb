class ProjectsController < ApplicationController

  def index
  end

  def new
    @project = Project.new()
  end

  def create
   @project = Project.new(params[:project])
    if @project.save!
      flash[:notice] = "Project has been scuessfully created"
      redirect_to @project
    end
  end

  def show
    @project = Project.find(params[:id])
  end

end