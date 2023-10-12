Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  resources :events, only: [:index, :new, :create, :show, :destroy] do
    post 'attend', on: :member
    delete 'unattend', on: :member
  end

  resources :users, only: [:show] do
    get 'attended_events', on: :member
  end
  
  resources :attendances, only: [:new, :create, :destroy]

  root to: 'events#index'
end
