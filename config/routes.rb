Rails.application.routes.draw do
  resources :badges
  resources :categories

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "badges#index"
end
