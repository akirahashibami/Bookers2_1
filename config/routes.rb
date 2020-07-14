Rails.application.routes.draw do

	root to: 'homes#index'

	# homes#show に　home/about というURLを渡している
  	get 'home/about' => 'homes#show'

	devise_for :users


	resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
	resources :users, only: [:show, :edit, :index, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
