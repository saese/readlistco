class CreateTlinks < ActiveRecord::Migration
  def change
    create_table :tlinks do |t|
      t.string :title
      t.text :content
      t.string :link
      t.references :subtopic

      t.timestamps
    end

    add_index :tlinks, :subtopic_id
  end
end
