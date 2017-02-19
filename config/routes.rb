Rails.application.routes.draw do
  resources :food_items do
  	resources :orders
  end
	
	get 'menu' => 'home#menu'
	get 'contact_us' => 'home#contact_us'
	get 'result' => 'orders#result'
	post 'item_detail' => 'home#item_detail'
	
	root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
