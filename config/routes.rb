#ルーティング

Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'lists/new'
  get 'top'=>'homes#top' # urlの「/homes/」を消す作業。
  post 'lists'=>'lists#create' #追記

# get 'lists/index' #削除し以下１行追加
  get 'lists'=>'lists#index' # indexアクションへのルーティングを作成

# get 'lists/show' #削除し以下１行追加
  get 'lists/:id'=>'lists#show',as: 'list'
   # .../lists/1 や .../lists/3 に該当
   # URLの部分...「lists/:id」idの前に :（コロン）を付けて指定
   # as:オプションを追加することで設定
   # 「'lists#show'の設定を、listとして利用できる」の意味

# get 'lists/edit' #削除し以下１行追加
  get 'lists/:id/edit'=>'lists#edit',as: 'edit_list'
   # 新しいeditアクションへのルーティングを作成
   # 名前付きルート（as: 'edit_list'）の記述を定義
   # lists/:id/editのように、ルーティングのURLに:idを用いて記述すると、
   # lists/◯◯/editのすべてのURLが対象
   
# 更新の場合はPATCHで指定
  patch 'lists/:id'=>'lists#update',as: 'update_list'
  
  delete 'lists/:id'=>'lists#destroy',as: 'destroy_list'
   # HTTPメソッド...DELETE
   # URL...lists/:id
   # 名前付きパス...destroy_list
  
  
# get 'homes/top'
# get 'homes/top' => 'homes#top'と同じ意味。


end
