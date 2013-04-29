Attendr::Application.routes.draw do
  root :to => "events#new"

  resources :events
  resources :attendees
end
