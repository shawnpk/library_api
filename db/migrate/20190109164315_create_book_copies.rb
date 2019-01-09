class CreateBookCopies < ActiveRecord::Migration[5.2]
  def change
    create_table :book_copies do |t|
      t.references :book, foreign_key: true, null: false
      t.string :isbn, index: true, null: false
      t.date :published, null: false
      t.integer :format, null: false
      t.string :user, foreign_key: true

      t.timestamps
    end
  end
end
