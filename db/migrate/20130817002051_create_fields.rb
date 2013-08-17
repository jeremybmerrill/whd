class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.integer :id
      t.string :col_name
      t.string :attribute_name
      t.text :definition
      t.string :display_name

      t.timestamps
    end
  end
end
