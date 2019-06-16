Rails.application.routes.draw do
  get 'welcome/index'
  
  devise_for :users
  resources :registros
  resources :productos

  root 'welcome#index'
end
