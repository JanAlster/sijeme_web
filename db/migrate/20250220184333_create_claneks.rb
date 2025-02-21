class CreateClaneks < ActiveRecord::Migration[8.0]
  def change
    create_table :claneks do |t|
      t.string :titul
      t.string :text

      t.timestamps
    end
  end
end
