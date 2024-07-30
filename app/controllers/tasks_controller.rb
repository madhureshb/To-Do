class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :show, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'Task was successfully created.'
      # byebug
      redirect_to @task
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      flash[:notice] = 'Task was updated successfully'
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = 'Task was deleted successfully'
    # byebug
    redirect_to root_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end

end
