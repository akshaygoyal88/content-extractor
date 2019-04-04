class CreateH3s < ActiveRecord::Migration[5.1]
  def change
    create_table :h3s do |t|
      t.belongs_to :url
      t.string :content
      t.string :link
      
      t.timestamps
    end
  end
end
