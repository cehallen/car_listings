CarListings::Application.routes.draw do
  root 'manufacturers#index'
  resources :manufacturers do
    resources :cars
  end
end
