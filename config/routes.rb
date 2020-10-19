Rails.application.routes.draw do
  #get 'comments/create'

  #get 'comments/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/', to: 'boards#index'
  # get 'boards', to: 'boards#index'
  # get 'boards/new', to: 'boards#new'
  # post 'boards', to: 'boards#create'
  # get 'boards/:id', to: 'boards#show'
  # http://192.168.99.100:3000/rails/info/routes
  #resources :boards, only: [:index, :new, :create, :show, :edit, :update, :delete]
  resources :boards
  resources :comments, only: %i[create destroy]
end
