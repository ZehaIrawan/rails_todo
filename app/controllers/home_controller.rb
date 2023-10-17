class HomeController < ApplicationController
  def index
    if(current_user)
      @todos = current_user.todos.all
      @new_todo = current_user.todos.new
    end
  end
end
