Rails.application.routes.draw do
  resources :recipies, only: :index
  resources :ingredients, only: :index
end
