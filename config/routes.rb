Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Event Type Route

  #CRUD
  get '/event_type', to: 'event_type#index'
  post '/event_type', to: 'event_type#create'
  get '/event_type/:id', to: 'event_type#show'
  patch '/event_type/:id', to: 'event_type#update'
  delete '/event_type/:id', to: 'event_type#destroy'

  # Person Route

  #CRUD
  get '/person', to: 'person#index'
  post '/person', to: 'person#create'
  post '/log_in', to: 'person#log_in'
  get '/person/:id', to: 'person#show'
  patch '/person/:id', to: 'person#update'
  delete '/person/:id', to: 'person#destroy'

  # Event Route

  #CRUD
  get '/event', to: 'event#index'
  post '/event', to: 'event#create'
  get '/event/:id', to: 'event#show'
  patch '/event/:id', to: 'event#update'
  delete '/event/:id', to: 'event#destroy'

  # Other
  get '/event/:id/type', to: 'event#type'       #Show event type
  get '/event/:id/present', to: 'event#present' #Show person present in event

  # Est Present Route

  #CRUD
  get '/est_present', to: 'est_present#index'
  post '/est_present', to: 'est_present#create'
  get '/est_present/:id', to: 'est_present#show'
  patch '/est_present/:id', to: 'est_present#update'
  delete '/est_present/:id', to: 'est_present#destroy'

  get '/person/:id/event', to: 'est_present#where'

  # Defines the root path route ("/")
  # root "posts#index"
end
