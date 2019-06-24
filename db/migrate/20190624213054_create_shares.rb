class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.string :symbol
      t.string :name
      t.string :price
      t.string :change
      t.string :persentChange
      t.string :volume
      t.string :marketCap
      t.string :ratio

      t.timestamps
    end
  end
end
