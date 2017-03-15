Rails.application.routes.draw do
  root to: "messages#index"

  get "/signup", to: "users#new"
  post "/users", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :messages, only: [:index, :create]
end
