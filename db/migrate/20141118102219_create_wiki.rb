class CreateWiki < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.string :content
    end
  end
end
