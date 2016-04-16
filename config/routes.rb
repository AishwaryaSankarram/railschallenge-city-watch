Rails.application.routes.draw do
  resources :emergencies, only: [:index, :create, :show, :update]
  resources :responders,  only: [:index, :create, :show, :update]
end
