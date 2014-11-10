class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :sample
      t.string :clip_path
      t.boolean :sequence, array: true, default: []
      t.references :song, index: true

      t.timestamps
    end
  end
end
