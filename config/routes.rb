Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount Plutus::Engine => "/plutus", :as => "plutus"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, as: nil, defaults: {format: 'json'} do
    namespace :v1, as: nil do
      get "assets" => "ledgers#assets"
      get "revenues" => "ledgers#revenues"
      get "liabilities" => "ledgers#liabilities"
      get "equities" => "ledgers#equities"
      get "accounts" => "ledgers#accounts"
      get "entries" => "ledgers#entries"
      get "amounts" => "ledgers#amounts"
      get "account_balance" => "ledgers#account_balance"
      post "add_entry" => "ledgers#add_entry"
    end
  end
end
