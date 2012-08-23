class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.text :original

      t.timestamps
    end
  end
end
