Rails.application.routes.draw do

  resources :inventories do
    collection do
      get :search
    end
  end
  get 'site/index'
  #get 'inventories/search' => 'inventories#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
