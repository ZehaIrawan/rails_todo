class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :show, :toggle, :destroy]

  def index
    @todos = current_user.todos.all
    @new_todo = current_user.todos.new
  end

  def show
    @todo = current_user.todos.find(params[:id])
  end

  def new
    @todo = current_user.todos.new
  end

  def create
    @todo = current_user.todos.new(todo_params)

    unless @todo.save
      head :unprocessable_entity
    end
  end

  def update
    #     @todo = current_user.todos.find(params[:id])

    #   puts "#{@todo.inspect} is an important task."
    #  respond_to do |format|
    #    if @todo.update(todo_params)
    #     format.turbo_stream { turbo_stream.replace(@todo) }
    #     else
    #       render :index, status: :unprocessable_entity
    #     end
    #   end
    @todo = current_user.todos.find(params[:id])
    @todo.update(todo_params)
    respond_to do |format|
      if @todo.update(todo_params)
        format.turbo_stream { turbo_stream.replace(@todo) }
        format.html { redirect_to todos_url, notice: "Todo was successfully updated." }
      else
        render :index, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @todo.destroy
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :is_done)
  end
end
