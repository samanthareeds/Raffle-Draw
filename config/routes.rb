Rails.application.routes.draw do
  resources :raffles
  root 'draws#new'
  resources :draws
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
