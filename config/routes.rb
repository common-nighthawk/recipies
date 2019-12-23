Rails.application.routes.draw do
  resources :recipies, only: [:index, :show]
  resources :ingredients, only: :index
end
