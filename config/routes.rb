Attendr::Application.routes.draw do
  root to: "events#new"

  resources :events, only: [:new, :create, :show]
  resources :attendees, only: :update
end
