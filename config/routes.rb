Rails.application.routes.draw do
  devise_for :users
  # get "/articles", to: "articles#index", as: :clube_do_bolinha

  resources :articles

  root to: "articles#index"
end
