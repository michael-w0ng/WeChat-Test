Rails.application.routes.draw do
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :restaurants, only: [:index, :show, :update, :create, :destroy]
    end
  end
end
