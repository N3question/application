Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'lists/new'
  get '/top'=>'homes#top' # urlの「/homes/」を消す作業。
  post 'lists'=>'lists#create' #追記
# get 'lists/index' #削除し以下１行追加
  get 'lists'=>'lists#index' # indexアクションへのルーティングを作成
# get 'lists/show' #削除し以下１行追加
  get 'lists/:id'=>'lists#show' 
   # .../lists/1 や .../lists/3 に該当
   # URLの部分...「lists/:id」idの前に :（コロン）を付けて指定
  get 'lists/edit'
  
# get 'homes/top'
# get 'homes/top' => 'homes#top'と同じ意味。


end
