Rails.application.routes.draw do
  get 'session/login'
  post 'session/create'
  get 'session/logout'
  resources :users
  root 'index#input'
  get 'index/input'
  get 'index/output'
  get 'task/results'
  get 'session/results'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
