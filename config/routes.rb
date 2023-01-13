Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit]
  resources :books, only: [:index, :show, :edit]
  get 'about' => 'homes#about'
  patch 'users/:id' => 'users#update', as: 'update_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
