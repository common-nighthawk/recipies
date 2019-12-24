Rails.application.routes.draw do
  root to: 'recipies#index'
  resources :recipies, only: [:index, :show]
  resources :ingredients, only: :index
  resources :lists, only: [:index, :create, :show]
  resources :items, only: :update
end
