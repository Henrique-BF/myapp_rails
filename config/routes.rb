Rails.application.routes.draw do
  # get "/articles", to: "articles#index", as: :clube_do_bolinha

  resources :articles
end
