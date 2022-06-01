Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  # ルートパスへのアクセスがあったら、messages_controllerのindexアクションを呼び出す
  root to: "messages#index"

  resources :users, only: [:edit,:update]
end
