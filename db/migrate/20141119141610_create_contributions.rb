class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.references :user
      t.references :wiki

      t.timestamp
    end
  end
end
