class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :trip
      t.text :content
      t.timestamps
    end
  end
end
