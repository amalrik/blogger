Blogger::Application.routes.draw do

  resources :authors

  root :to => 'articles#index'
  resources :tags
  resources :comments
  resources :articles
end
