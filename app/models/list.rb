class List < ApplicationRecord
 has_one_attached :image #追加
 # Listモデルにtitleとbodyに加えて
 # 画像を扱うためのimageカラムが追記されたかのように
 # 扱うことができる
 
 validates :title,presence: true
 validates :body,presence: true
 validates :image,presence: true  
 # コメントアウト中。rails cの為。解除中。
 
 # validatesで対象とする項目を指定し、
 # 入力されたデータのpresence（存在）をチェック
 # trueと記述すると、データが存在しなければならないという設定
 # NEXT 返されたバリデーションの結果を、コントローラで検出
end
