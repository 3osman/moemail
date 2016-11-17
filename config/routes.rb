Rails.application.routes.draw do
	
  get 'emails/view'
  root to: 'direct#new'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
