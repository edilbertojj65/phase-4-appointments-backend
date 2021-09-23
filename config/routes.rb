Rails.application.routes.draw do
  resources :reviews, only: [:index, :show, :create, :destroy, :update]
  resources :physicians, only: [:index, :show, :create, :update]
  resources :logins , only: [:index, :show, :create, :update]
  resources :patients, only: [:index, :show, :create, :update]
  resources :appointments, only: [:index, :show, :create, :destroy, :update]

  get '/appointments/:appointments_id/reviews', to: 'appointments#reviews_index'
  get '/appointments/:appointments_id/reviews/:id', to: 'appointments#review'

  get "/sessions", to: "sessions#index"
  post "/login", to: "sessions#create"
  get "/me", to: "logins#showlogin"
  delete "/logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
