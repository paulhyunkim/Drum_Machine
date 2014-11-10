class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :tempo
      t.references :user, index: true

      t.timestamps
    end
  end
end
