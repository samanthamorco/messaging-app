Rails.application.routes.draw do
  root to: "messages#index"

  get "/signup", to: "users#new"
  post "/users", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :messages, only: [:index, :create]

  namespace :api do
    namespace :v1 do
      resources :messages, only: [:index, :create]
    end
  end
end
