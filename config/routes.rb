Rails.application.routes.draw do
  resources :hots
  resources :trendings
  resources :freshes
  resources :cutes
  root to: 'hots#crawl'
  get '/hot_db' => 'hots#dbhot'
  get '/trending_db' => 'hots#dbtrending'
  get '/fresh_db' => 'hots#dbfresh'
  get '/cute_db' => 'hots#dbcute'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
