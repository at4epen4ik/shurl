Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post	'/', :to =>	'short_url#create'
  get '/:short_url', :to => 'short_url#show'


  root 'short_url#main'


end
