Rails.application.routes.draw do
  root to: 'places#index'
  resources :places, only: %w(show create)
end
