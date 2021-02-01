Rails.application.routes.draw do
  get 'donations/index'
  root to: 'home#index'

  resources :donors, :donations # , only: [:show, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
