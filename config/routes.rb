Sudoku::Application.routes.draw do
  resources :users


  resources :games


	root :to => 'games#index', :as => 'index'
end
