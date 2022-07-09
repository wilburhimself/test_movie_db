Rails.application.routes.draw do
  root to: 'pages#index'

  namespace :api, defaults: { format: :json } do
    resources :movies, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
