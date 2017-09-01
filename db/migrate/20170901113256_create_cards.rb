class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :question
      t.string :answer
      t.references :deck

      t.timestamps
    end
  end
end
