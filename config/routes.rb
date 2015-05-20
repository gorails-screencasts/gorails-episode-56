Rails.application.routes.draw do
  resources :todos do
    member do
      patch :complete
    end
  end
  root to: "todos#index"
end
