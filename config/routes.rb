Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  resources :events, only: [:index, :new, :create, :show] do
    post 'attend', on: :member
  end

  resources :users, only: [:show]
  resources :attendances, only: [:new, :create]

  root to: 'events#index'
end
