Rails.application.routes.draw do
  resources :items do
    member do
      get :q_to_c
      put :q_to_c_update
      get :c_to_p
      put :c_to_p_update
      get :p_to_i
      put :p_to_i_update
      get :add_payment
      put :add_payment_update
    end
  end
  resources :users

  get 'page/main'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/users' => 'users#index'
  get 'users/new'
  post '/users' => 'users#create'

  root 'page#main'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
