class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new()
  end

  def create
   @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Project has been scuessfully created"
      redirect_to @project
    else
      flash[:alert] = "Project has not been created."
      render :action => "new"
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "Record scuessfully updated"
      redirect_to @project
    else
      flash[:notice] = "Failed to update"
      render :action => "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "deleted"
    redirect_to projects_path
  end

end
