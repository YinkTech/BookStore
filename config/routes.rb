# frozen_string_literal: true

Rails.application.routes.draw do
  resources :groups
  resources :items, except: %i[show edit update] do
    get :uncategorized, on: :collection
  end
  devise_for :users
  get 'home/index'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
