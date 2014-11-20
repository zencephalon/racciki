class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.references :wiki
      t.text :content
      t.string :revision_id

      t.timestamps
    end
  end
end
