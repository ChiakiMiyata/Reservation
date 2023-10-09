Rails.application.routes.draw do
  get 'users/top'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
    }
  resource :users
end
