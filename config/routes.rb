Rails.application.routes.draw do
  devise_for :users
  resources :events
  post 'join', to:"events#join_event"
  post 'unjoin', to:"events#unjoin_event"
  get '/user/:id', action: :show, controller: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "events#index"
end
