class List < ApplicationRecord
 has_one_attached :image #追加
 # Listモデルにtitleとbodyに加えて
 # 画像を扱うためのimageカラムが追記されたかのように
 # 扱うことができる
end
