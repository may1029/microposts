Rails.application.routes.draw do
  get 'sessions/new'

  # get 'users/new'

  #get 'static_pages/home'
  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :follower
    end
  end
  resources :microposts
  resources :relationships, only: [:create, :destroy]

end
