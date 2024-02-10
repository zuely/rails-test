class AddUrlToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :url, :string, null: false, default: ''
  end
end
