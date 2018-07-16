class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :original_url, null: false
      t.string :short_url, limit: 7, null: false, index: true

      t.timestamps
    end
  end
end
