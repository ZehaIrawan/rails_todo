class TodosController < ApplicationController
  def index
    @todos = @current_user.todos
  end

  def show
  end
end
