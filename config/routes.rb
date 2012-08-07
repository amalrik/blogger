Blogger::Application.routes.draw do

  root :to => 'articles#index'
  resources :tags
  resources :comments
  resources :articles
end
