Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # match '*all' => 'application#cors_preflight_check', :constraints => { method: 'OPTIONS' }

  resources :requests
  resources :assets
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  # post "/signup", to: "user#create"
  get "/me", to: "users#show"
  
  # get asset allocataed to logined user
  get "/myassets", to: "assets#my_assets"

end
