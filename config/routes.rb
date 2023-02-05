Rails.application.routes.draw do


  # mount LetterOpenerWeb: :Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end

  resources :books, except: [:new] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  get "search" => "searches#search", as: 'search'

  resources :groups do
    get 'join' => "groups#join"
    get 'new/mail' => "groups#new_mail"
    get 'send/mail' => "groups#send_mail"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
