class AddPhotoToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :photo, :string
    add_column :posts, :caption, :text
    add_reference :posts, :user, foreign_key: true
  end
end
