# コントローラ

class ListsController < ApplicationController
 def new
  # Viewへ渡すためのインスタンス変数に
  # 空のModelオブジェクトを生成する。
 @list = List.new
 end
  
 def create #投稿を保存するためのアクションを定義
  # １.&2. データを受け取り新規登録するためのインスタンス作成
  @list = List.new(list_params)
  
  # 3. データをデータベースに保存するためのsaveメソッド実行
  # list.save
  
  # validationの結果を、コントローラで検出
  # if式を用いる。
  if @list.save #以下バリデーションチェックの工程
   # redirect_to list_path(@list.id)
    # 対象のカラムにデータが入力　→saveメソッドでtrue。
    # 次に表示したいページにリダイレクト
    
      # 以下フラッシュメッセージを定義し、詳細画面へリダイレクト
  flash[:notice] = "投稿が成功しました"
  redirect_to list_path(@list.id)
  # 書き方は特殊ですが、使い方はほとんど変数と同じ
  # NEXT Viewファイルの記述
  
  else
   
 　@lists = List.all  # renderを使う時に記述
     # renderしたアクションが必要なインスタンス変数を用意
     # renderを扱う上で気をつけるべきこと
     # renderするビューに必要なインスタンス変数は、あらかじめ用意しなくてはならない
   
   render :new
 # render :index #<= new から indexに変更
     # Listモデルの新規登録に失敗した際にrenderされるViewをnewからindexに変更
   
   # 対象のカラムにデータが入力×　→saveメソッドでfalse。
   # 新規投稿ページを再表示するように設定
   # render :アクション名で、同じコントローラ内の別アクションのViewを表示
   
   # 4. トップ画面へリダイレクト
   # redirect_to'/top'　削除。以下に変更
   # 詳細画面へリダイレクト
   # redirect_to list_path(@list.id)
  end
 end

 def index #一覧画面用のアクションとして定義
  @lists = List.all #全てのデータを取得する記述
   # @lists...(@)付きの変数はインスタンス変数
   # all...メソッドの一種。istsテーブルに保存されている全てのデータを取得することができます。
   #       そのモデルがやりとりしているデータベースの
   #       テーブルに保存されている、
   #       全てのレコードをまとめて取得
   #       idに関係なく、存在するレコードを全て取得する
 end

 def show #詳細画面の表示のアクションとして定義
  @list = List.find(params[:id]) 
  # 今回はレコードを1件だけ取得する
  # インスタンス変数名は単数形の「@list
  # findメソッド...引数を受取、idカラムを引数と比較し
  #.               レコードを取得するメソッド
 end
 
  # List.find(1) #listsテーブルの中にあるidが1のレコードを取得
  # List.find(2) #listsテーブルの中にあるidが2のレコードを取得
  
  # 「List.find(params[:id])」という記述が意味していること
  # /lists/1    => List.find(params[:id]) => idが1のレコードを取得
  # /lists/3    => List.find(params[:id]) => idが3のレコードを取得
  # /lists/hoge => List.find(params[:id]) => idがhogeのレコードを取得(普通は存在しないのでエラーになります)
 

 def edit #編集機能のアクションとして定義
  @list = List.find(params[:id]) # findメソッドを用いて、データを取得
 end
 
 def update #更新機能のアクションとして定義
  list = List.find(params[:id])
  list.update(list_params)
  redirect_to list_path(list.id)
 end
 
 # ビュー側で実装する「削除」ボタンをクリックすると、削除リストのid付きでURLが送信されます。
 # 送られてきた削除idを元にレコードが探され、そのレコードを削除します。
 def destroy #データの削除のアクションとして定義
  # データ（レコード）を1件取得
  list = List.find(params[:id])
  
  # データ（レコード）を削除
  list.destroy
  
  # 投稿一覧画面へリダイレクト
  redirect_to '/lists'
 end
  
 private #一種の境界線。controllerの中でしか呼び出せません
 # Controllerファイルの一番下のendのすぐ上に書く。 
 # ストロングパラメータ。list_paramsの箇所。
 def list_params #保存できるカラムを限定、マスアサインメント脆弱性を防ぐ
  params.require(:list).permit(:title,:body,:image)
  # ストロングパラメータ内にimageを追加し、imageのデータの取得を許可
  # ここまでで画像が投稿が可能に。
  # --NEXT--
  # 画像を表示するための記述をindex(一覧画面)とshow(詳細画面)に追記
 end
 
end
