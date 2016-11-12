Rails.application.routes.draw do
	get 'direct/new'
	root to: 'direct#new'

	devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
