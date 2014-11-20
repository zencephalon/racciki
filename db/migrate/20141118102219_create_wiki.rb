class CreateWiki < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.integer :revision_id, default: 0
    end
  end
end
