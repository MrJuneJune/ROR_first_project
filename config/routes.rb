Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contacts, only: [:new, :create]
  resources :graph, only: [:index, :create]
  root 'main_page#index', as: 'home'

  namespace 'api' do
    namespace 'v1' do
      resources :usersdata
    end
  end
end
