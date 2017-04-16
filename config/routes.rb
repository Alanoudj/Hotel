Rails.application.routes.draw do
  root 'hotels#search'
  get 'search', to: 'hotels#search'

  match "*path", to: redirect('/'), via: :all
end
