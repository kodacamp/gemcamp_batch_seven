Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  get 'about_us', to: 'welcome#about_us'
  get 'contact', to: 'welcome#contact'

  get 'posts', to: 'posts#index'
  post 'posts', to: 'posts#create'
  get 'posts/new', to: 'posts#new'
  get 'posts/:id', to: 'posts#show'
end
