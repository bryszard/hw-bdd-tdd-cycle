Rottenpotatoes::Application.routes.draw do
  
  root :to => redirect('/movies')
  
  resources :movies
  # map '/' to be a redirect to '/movies'
  
  get 'movies/:id/directors' => 'movies#directors', :as => 'directors'
  
end
