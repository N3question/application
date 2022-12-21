class ListsController < ApplicationController
 def new
  # Viewへ渡すためのインスタンス変数に
  # 空のModelオブジェクトを生成する。
 @list = List.new
 end
  
 def create #投稿を保存するためのアクションを定義
  # １.&2. データを受け取り新規登録するためのインスタンス作成
  list = List.new(list_params)
  # 3. データをデータベースに保存するためのsaveメソッド実行
  list.save
  # 4. トップ画面へリダイレクト
  redirect_to'/top'
 end

 def index #一覧画面用のアクションとして定義
  @lists = List.all #全てのデータを取得する記述
   # @lists...インスタンス変数
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
  
 private #一種の境界線。controllerの中でしか呼び出せません
 # Controllerファイルの一番下のendのすぐ上に書く。 
 # ストロングパラメータ。list_paramsの箇所。
 def list_params #保存できるカラムを限定、マスアサインメント脆弱性を防ぐ
  params.require(:list).permit(:title,:body)
 end

end
