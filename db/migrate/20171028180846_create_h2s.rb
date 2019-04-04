class CreateH2s < ActiveRecord::Migration[5.1]
  def change
    create_table :h2s do |t|
      t.belongs_to :url
      t.string :content
      t.string :link
      
      t.timestamps
    end
  end
end
