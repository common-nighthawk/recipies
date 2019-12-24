Rails.application.routes.draw do
  resources :recipies, only: [:index, :show]
  resources :ingredients, only: :index
  resources :lists, only: [:index, :create, :show]
  resources :items, only: :update
end
