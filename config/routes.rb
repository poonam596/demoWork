Rails.application.routes.draw do
  resources :candidate_details
  get 'home/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  namespace :api do
    namespace :v2 do
      resources :mobiles 
      post 'auth/register' , to: 'users#register'
      post 'auth/login' , to: 'users#login'
      get 'test' , to: 'users#test'
       #get 'mobiles/mobiles_login'
       #get 'mobiles/index'
       #post 'mobiles/create'
       post 'mobiles/login'
       post 'mobiles/create'
       get 'mobiles/logout'
       post 'mobiles/user_new'
       post 'mobiles/user_new' => 'mobiles#user_new'
    
    end
  end

  namespace :api do
    namespace :v2 do
      resources :candidateapi 
       post 'candidateapi/create'
       

    
    end
  end

  resources :users
  root 'home#index'
  get 'users/new'
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
