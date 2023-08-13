class TodosController < ApplicationController
  def index
    @todos = current_user.todos.all
  end

  def new
    # @todo = Todo.new
    @todo = current_user.todos.new
  end

  def create
    @todo = current_user.todos.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todo_url(@todo), notice: "todo was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def todo_params
    params.require(:todo).permit(:title, :is_done)
  end
end
