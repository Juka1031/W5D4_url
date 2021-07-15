class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :visitor, null:false
      t.integer :visited_short_urls, null:false

      t.timestamps
    end

    add_index :visits, :visitor 
    add_index :visits, :visited_short_urls
  end
end
