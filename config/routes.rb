Blogger::Application.routes.draw do
 resources :articles do
  resources :comments

end
 root to: 'articles#index'
 resources :tags
 resources :authors
 resources :author_sessions, only: [ :new, :create, :destroy ]

get 'login'  => 'author_sessions#new'
get 'logout' => 'author_sessions#destroy'
end