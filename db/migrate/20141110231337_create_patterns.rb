class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :sample
      t.string :clip_path
      t.text :sequence, array: true, default: []
      t.references :song, index: true

      t.timestamps
    end
  end
end
