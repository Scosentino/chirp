class CreateChirps < ActiveRecord::Migration
  def change
    create_table :chirps do |t|
      t.string :from
      t.text :description
      t.string :url

      t.timestamps null: false
    end
  end
end
