Rails.application.routes.draw do
  get 'welcome/index'

  resources :registros
  resources :productos
  resources :egreso_dineros
  resources :ingreso_dineros

  root 'welcome#index'
end
