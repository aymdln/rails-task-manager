class TasksController < ApplicationController
    def index         # GET /tasks
      @tasks = Task.all
      if @tasks.count == 0
        @title_page = "Vous n'avez pas de tache"
      elsif @tasks.count == 1
        @title_page = "Voici votre tache"
      else
        @title_page = "Voici vos #{@tasks.count} taches"
      end
    end
  
    def show          # GET /tasks/:id
      @task = Task.find(params[:id])
      @check = @task.completed ? 'far fa-check-circle checked' : 'far fa-circle'
      @text_check = @task.completed ? 'This task is completed' : 'This task is not completed'
    end
  
    def new           # GET /tasks/new
      @task = Task.new
    end
  
    def create        # POST /tasks
      @task = Task.new(task_params)
      @task.save

      redirect_to task_path(@task)
    end
  
    def edit          # GET /tasks/:id/edit
      @task = Task.find(params[:id])

    end
  
    def update        # PATCH /tasks/:id
      @task = Task .find(params[:id])
      @task.update(task_params)

      redirect_to task_path(@task)
    end
  
    def destroy       # DELETE /tasks/:id
    end

    private

    def task_params
      params.require(:task).permit(:title, :details)
    end
end
