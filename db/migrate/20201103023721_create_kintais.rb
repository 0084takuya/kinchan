class CreateKintais < ActiveRecord::Migration[6.0]
  def change
    create_table :kintais do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
