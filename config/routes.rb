TurnItOn::Application.routes.draw do

  # Canvas App
  resource :canvas, :only => [:show, :create]

  # Connect Site
  resource :users, :except => :create do
    get :callback, :to => :create
  end
  
  #Send Message
  resources :messages, :only => [:new, :create]
  
  root :to => 'home#index'
end
