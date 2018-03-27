Rails.application.routes.draw do
  get 'items/create'

  devise_for :users

  get  'welcome/index'

  root 'users#show'

  resources :users do
    resources :items
  end

end
