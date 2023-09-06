Rails.application.routes.draw do
    devise_for :users
    resources :users do
      resources :recipes
      resources :foods
      resources :recipe_foods
    end
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
    # Defines the root path route ("/")
    root "users#index"
  end