class ListsController < ApplicationController
 def new
  # Viewへ渡すためのインスタンス変数に
  # 空のModelオブジェクトを生成する。
 @list = List.new
 end
  
  #以下投稿を保存するためのcreateアクションを追加
 def create
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
 end

 def show
 end

 def edit
 end
  
 private #一種の境界線。controllerの中でしか呼び出せません
 # Controllerファイルの一番下のendのすぐ上に書く。 
 # ストロングパラメータ。list_paramsの箇所。
 def list_params #保存できるカラムを限定、マスアサインメント脆弱性を防ぐ
  params.require(:list).permit(:title,:body)
 end

end
