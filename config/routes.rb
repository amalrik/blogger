Blogger::Application.routes.draw do


  root :to => 'articles#index'
  resources :tags
  resources :comments
  resources :articles

  resources :author_sessions
  resources :authors

  match 'login'  => 'author_sessions#new',     :as => :login
  match 'logout' => 'author_sessions#destroy', :as => :logout
end
