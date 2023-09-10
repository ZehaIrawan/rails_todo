Rails.application.routes.draw do
  # get "todos/index"
  # get "todos/show"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  # resources :todos
  resources :todos, only: [:index, :create, :show, :edit, :update, :destroy] do
    post :toggle, on: :member
  end
end
