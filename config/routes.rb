Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #sets root file
  root "articles#index"

  # route to articles
  # get "/articles", to: "articles#index"

  # the rails way to write RESTful routes
  resources :articles do
    resources :comments
  end
end
