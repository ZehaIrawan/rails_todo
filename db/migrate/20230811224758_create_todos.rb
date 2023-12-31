class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.boolean :is_done
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
