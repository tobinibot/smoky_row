# see https://guides.rubyonrails.org/routing.html for details
Rails.application.routes.draw do
  root to: 'home#index'

  resources :donors, :donations # , only: [:show, :update, :destroy]

  get 'statements/index'
  get 'statements/generate'
end
