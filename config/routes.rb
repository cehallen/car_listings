CarListings::Application.routes.draw do
  root 'manufacturers#index'
  resources :manufacturers#, only: [:index, :new, :create, :show]
  resources :cars#, only: [:index, :new, :create]
end
