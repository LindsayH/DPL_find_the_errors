class TasksController < ApplicationController
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
                # the method is set_tasks not set_task
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
     @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render "edit"
    end
  end

  def destroy
    @task.delete
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    def set_tasks
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:priority, :description)
    end
end
