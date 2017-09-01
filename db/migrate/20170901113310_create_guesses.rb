class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.boolean :answer, default: false
      t.string :user_guess
      t.references :card
      t.references :round

      t.timestamps
    end
  end
end
