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
    get :favorites, on: :member
    member do
      get :following, :follower# , :favorite
    end
  end

  resources :microposts do
      resource :favorites, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end
