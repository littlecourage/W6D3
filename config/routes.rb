Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :create, :show, :update, :destroy]
  resources :artworks, only: [:index, :create, :show, :update, :destroy]
  resources :artwork_shares, only: [:create, :destroy]
  resources :users, only: [:index] do 
    resources :artworks , only: [:index]
  end
end

