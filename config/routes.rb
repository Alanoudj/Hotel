Rails.application.routes.draw do
  resources :offers, only: [:index]

  root 'offers#index'
  match "*path", to: 'application#routing_error', via: :all
end
