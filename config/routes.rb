Hotornot::Application.routes.draw do
  resources :votables do
    member { post :vote }
  end

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: :logout

  root to: "votables#index"
end
