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
    end
  
    def create        # POST /tasks
    end
  
    def edit          # GET /tasks/:id/edit
    end
  
    def update        # PATCH /tasks/:id
    end
  
    def destroy       # DELETE /tasks/:id
    end
end
