Rails.application.routes.draw do
  get 'venues/search' => 'venues#search'
  resources :venues
  resources :visitors
  root to: 'venues#index'
end
