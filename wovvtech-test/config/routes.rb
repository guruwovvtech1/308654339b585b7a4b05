Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    resources :users
  end
  get '/api/typeahead/:input', to: 'api/users#typeahead'
end
