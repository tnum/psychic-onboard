Rails.application.routes.draw do

  # we want to add the ability to create, update, delete and view rooms
  resources :rooms

  # sign up
  resources :users

  # log in and log out
  # singular resouce because we only want to do this once - would be the same as profile/account settings
  # hence the use of sigular"resource" and "session"
  resource :session

  # home page is the list of rooms
  root "rooms#index"

end
