Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users , only: [:create,:destroy,:index,:show,:update] do
    resources :artworks, only: [:index]
  end 
  resources :artworks, only: [:create,:destroy,:show,:update]
  resources :artwork_shares, only: [:create,:destroy]

  # get 'users/:id', to: 'users#show', as: 'user1'
  # get 'users/:user_id/artworks', to: 'users#index'
  # get 'users/new', to: 'users#new', as: 'user3'
  # get 'users/:id/edit', to: 'users#edit', as: 'user4'
  # post 'users', to: 'users#create', as: 'use5'
  # patch 'users/:id', to: 'users#update', as: 'use6'
  # put 'users/:id', to: 'users#update', as: 'use7'
  # delete 'users/:id', to: 'users#destroy', as: 'use8'
end
