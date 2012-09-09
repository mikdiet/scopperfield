class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :cover
      t.boolean :readed
      t.datetime :readed_at
      t.integer :pages

      t.timestamps
    end
  end
end
