Rails.application.routes.draw do
  namespace :v1 do resources :users, except: [:new, :edit] end
  devise_for :users, only: []

  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resources :users, only: [:create]
  end
end
