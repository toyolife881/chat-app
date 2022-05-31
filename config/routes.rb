Rails.application.routes.draw do
  get 'messages/index'
  # ルートパスへのアクセスがあったら、messages_controllerのindexアクションを呼び出す
  root to: "messages#index"
end
