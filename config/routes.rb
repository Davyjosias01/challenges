Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"

  }

  namespace :api do
    namespace :v1 do
      resources :challenges
    end
  end
end
