Rails.application.routes.draw do

  devise_for :users

  get  'welcome/index'

  root 'users#show'

  resources :users, only: [:show] do
     resources :items, only: [:create, :destroy]
   end

end
