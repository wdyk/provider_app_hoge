Rails.application.routes.draw do
  use_doorkeeper_openid_connect
  get 'welcome/index'
  root :to => 'welcome#index'
  use_doorkeeper
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, format: 'json' do
    get 'login', to: 'credentials#login'
  end
end
