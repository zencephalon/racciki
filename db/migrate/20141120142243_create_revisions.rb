class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.references :wiki
      t.text :content
      t.integer :revision_id
      t.references :user

      t.timestamps
    end
  end
end
