Rails.application.routes.draw do
  root 'users#index'
  get 'users/profile'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
    }
  resources :users
  resources :rooms do
    collection do
      get 'search'
      get 'area'
    end
  end
  resources :reservations do
    member do
      post 'confirm' => 'reservations#confirm'
      post 'back' => 'reservations#back'
    end
  end
end
