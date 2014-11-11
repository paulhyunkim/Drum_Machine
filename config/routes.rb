Rails.application.routes.draw do

  root 'main#index'
  resource :sessions, only: [:new, :create, :destroy]
  resource :users, only: [:new, :create, :show]
  resource :songs, only: [:new, :create, :update, :destroy]
  resource :patterns, only: [:new, :create, :update, :destroy]
  resource :main, only: [:index]

end
