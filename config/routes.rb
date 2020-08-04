Rails.application.routes.draw do

  devise_for :users
  get 'messages/index'
  root "messages#index"
  
  resources :users, omly:[:edit, :update]
end
