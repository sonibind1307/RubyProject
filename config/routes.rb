Rails.application.routes.draw do
  resources :campanies
  resources :orders
  resources :products
  resources :categories
  # devise_for :users
  # get 'homes/index'

  resources :bands
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  devise_for :users, path: 'api/auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "homes#index"
end
