class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    # task_deets = params.require('task').permit(:title, :details, :completed)
    @task = Task.create(strong_params)
    redirect_to tasks_path(@task)
  end

  def edit
  end

  def update
    @task.update(strong_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path(@task)
  end

  private

  def strong_params
    params.require('task').permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end

# As a user, I can list tasks -- index
# As a user, I can view the details of a task -- show
# As a user, I can add a new task
# get new, post add
# As a user, I can edit a task (mark as completed / update title & details)
# As a user, I can remove a task
