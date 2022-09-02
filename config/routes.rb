Rails.application.routes.draw do
  devise_for :users
  root to: "trips#index"
  resources :users, only: :show
  resources :trips
end
