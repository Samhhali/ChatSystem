Rails.application.routes.draw do

  root controller: :chats, action: :index


  resources :messages
  resources :chats
  resources :applications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
