Rails.application.routes.draw do
	devise_for :users
	resources :posts
  
  get 'about' => 'welcome#about'
  get 'posts' => 'welcome#posts'
root to: 'welcome#index'
end
