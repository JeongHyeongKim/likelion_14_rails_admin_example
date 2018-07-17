class AddBirdUploaderToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :bird, :string
  end
end
