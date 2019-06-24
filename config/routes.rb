Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get 'users/authorization', to: 'users#authorization'
      resources :users, only: [:create, :show, :update, :destroy] do
        resources :favorites, only: [:create, :index]
        delete 'favorites/remove', to: 'favorites#remove'
        get 'favorites/companies', to: 'favorites#companies'
      end
      get 'shares/companies', to: 'shares#companies'
      resources :shares, only: [:create, :index]
    end
  end
end
