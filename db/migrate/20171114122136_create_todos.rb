class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :notes
      t.datetime :due_date
      t.boolean :done

      t.timestamps
    end
  end
end
