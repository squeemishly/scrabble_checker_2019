Rails.application.routes.draw do
  root "home#index"

  resources :home, only: [:index]
  resources :search, only: [:index]
end
