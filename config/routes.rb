Rails.application.routes.draw do
  resources :orders
  resources :food_items
	resources :food_items
	get 'menu' => 'home#menu'
	get 'contact_us' => 'home#contact_us'
	
	root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
