Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get 'users/authorization', to: 'users#authorization'
      resources :users, only: [:create, :show, :update, :destroy]
    end
  end
end
