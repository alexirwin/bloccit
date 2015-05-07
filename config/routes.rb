Rails.application.routes.draw do
  get 'summaries/index'

  get 'summaries/new'

  get 'summaries/show'

  get 'summaries/edit'

  get 'topics/index'

  get 'topics/new'

  get 'topics/show'

  get 'topics/edit'

	devise_for :users
   
   resources :topics do
     resources :posts, except: [:index]
   end

   resources :summaries do
     resources :posts, except: [:index]
   end

  
  get 'about' => 'welcome#about'
  get 'posts' => 'welcome#posts'
root to: 'welcome#index'
end
