Rails.application.routes.draw do

  root 'main#index'
  resource :sessions, only: [:new, :create, :destroy]
  resource :users, only: [:new, :create]
  resources :songs, only: [:index, :new, :create, :edit, :update, :destroy]
  resource :patterns, only: [:new, :create, :edit, :update, :destroy]

end
