Rails.application.routes.draw do
  # static routes
  get 'about' => 'static#about'
  get 'sayhi' => 'static#sayhi'
  
  # dynamic routes

  root 'records#index'
  resources :records

end
