CarListings::Application.routes.draw do
  root 'manufacturers#index'
  resources :manufacturers
end
