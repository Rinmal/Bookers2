Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :edit, :create]
  get 'about' => 'homes#about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
