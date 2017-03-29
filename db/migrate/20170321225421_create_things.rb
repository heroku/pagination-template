class CreateThings < ActiveRecord::Migration[5.0]
  def change
    create_table :things do |t|
      t.column :name, :text, null: false, limit: 80
    end
  end
end
