Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  get 'about_us', to: 'welcome#about_us'
  get 'contact', to: 'welcome#contact'

  resources :posts do
    resources :comments, except: :show
  end

  # resources :posts do
  #   collection do
  #     patch 'bulk_update'
  #     get 'archives'
  #   end
  #   member do
  #     get 'details'
  #     get 'authors'
  #     get 'publishers'
  #   end
  #
  #   # patch 'bulk_update', on: :collection
  #   # get 'archives', on: :collection
  #
  #   # get 'details', on: :member
  #   # get 'authors', on: :member
  #   # get 'publishers', on: :member
  # end

  #get 'posts/authors', to: 'posts#authors', as: 'posts_authors'

  # TODO: read the difference between `resource` and `resources`

  # get 'posts', to: 'posts#index'
  # post 'posts', to: 'posts#create'
  # get 'posts/new', to: 'posts#new'
  # get 'posts/:id/edit', to: 'posts#edit', as: 'edit_post'
  # get 'posts/:id', to: 'posts#show', as: 'post'
  # patch 'posts/:id', to: 'posts#update'
  # put 'posts/:id', to: 'posts#update'
  # delete 'posts/:id', to: 'posts#destroy'
end
