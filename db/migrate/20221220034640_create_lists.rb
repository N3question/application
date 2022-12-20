class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
     t.string :title #カラムの定義
     t.string :body  #カラムのデータ型は、string型
     t.timestamps
    end
  end
end
