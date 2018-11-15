class CreateClickers < ActiveRecord::Migration[5.2]
  def change
    create_table :clickers do |t|
      t.integer :clickers, default: 0
      t.date :dates
      t.timestamps
    end
  end
end
