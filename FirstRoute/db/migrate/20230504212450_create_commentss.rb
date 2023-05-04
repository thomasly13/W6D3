class CreateCommentss < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :body, :text, null: false, limit: 100
    add_column :comments, :author_id, :bigint, null: false
    add_column :comments, :artwork_id, :bigint, null: false
    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :artworks, column: :artwork_id

  end
end
