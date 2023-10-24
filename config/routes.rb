Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
    }
  resources :users
  resources :rooms do
    collection do
      get 'search'
    end
    resources :reservations
  end
end
