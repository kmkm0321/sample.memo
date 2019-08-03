Rails.application.routes.draw do
  get 'posts/index' => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  
  post "posts/:id/update" => "posts#update"
  post "posts/create" => "posts#create"
  post "posts/:id/destroy" => "posts#destroy"

  get 'home/top' => "home#top"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  
  get "signup" => "users#new"
  get "users/index" => "users#index"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/destroy" => "users#destroy"
  post "users/:id/update" => "users#update"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
