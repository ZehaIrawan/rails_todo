class TodosController < ApplicationController
  def index
    @todos = current_user.todos.all
    @todo = current_user.todos.new
  end

  def show
    @todo = current_user.todos.find(params[:id])
  end

  def new
    # @todo = Todo.new
    @todo = current_user.todos.new
  end

  def create
    @todo = current_user.todos.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.turbo_stream
        format.html { redirect_to todo_url(@todo), notice: "todo was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: "Todo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def todo_params
    params.require(:todo).permit(:title, :is_done)
  end
end
