Rails.application.routes.draw do
 #get 'books' => 'books#index' as: books
 #post 'books' => 'books#create'
 #get 'books/new' => 'books#new' as: new_book
root to: 'books#top'

 get'top' => 'books#top'

 get'books/:id' =>'books#show', as:'book'

 patch 'books/:id' => 'books#update', as: 'update_book'


 resources :books, only:[:new, :index, :create, :show, :edit, :update, :destroy]
end

