Rails.application.routes.draw do
  devise_for :users
  # get "/articles", to: "articles#index", as: :clube_do_bolinha

  resources :articles do
    resources :comments
  end

  root to: "articles#index"
end
