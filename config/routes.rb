Rails.application.routes.draw do
  scope module: :v1 do
    resources :authors, except: %i[new edit]
    resources :books, except: %i[new edit]
    resources :book_copies, except: %i[new edit]
    resources :users, except: %i[new edit]
  end
end
