Rails.application.routes.draw do
  resources :kintais do
    collection do
      get 'start', to: 'kintais#start'
      get 'end', to: 'kintais#end'
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
