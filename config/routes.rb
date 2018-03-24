Rails.application.routes.draw do
  devise_for :users

    get 'welcome/index'
  
    root 'users#show'

end
