Rails.application.routes.draw do
    devise_for :users
    resources :users do
      resources :recipes
      resources :foods
      resources :recipe_foods
    end
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    # Define a route for the "Public Recipes" page
    get 'recipes/index', to: 'recipes#index', as: 'recipes_index'
    # Defines the root path route ("/")
    root "users#index"
  end