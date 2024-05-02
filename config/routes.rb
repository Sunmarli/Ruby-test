Rails.application.routes.draw do
  root "articles#index"
  
  resources :articles do
    resources :comments
  end
 
  resources :authors, only: [:new, :create, :index, :show,:edit]
  





  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "posts#index"

end
