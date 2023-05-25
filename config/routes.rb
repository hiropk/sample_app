Rails.application.routes.draw do
  root "static_pages#home"
  get    "/",        to: "static_pages#home"
  get    "/help",    to: "static_pages#help"
  get    "/about",   to: "static_pages#about"
  get    "/contact", to: "static_pages#contact"
  get    "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  # users, account_activationsコントローラのそれぞれにリソースベースのルーティングを設定
  # これにより、index, show, new, edit, create, update, destroyアクションを個別に定義しなくて済む。
  # onlyオプションをつけることで、該当のアクションのみに限定できる。
  resources :users
  resources :account_activations, only: [:edit]
end