class PopulateUrlInArticles < ActiveRecord::Migration[7.1]
  def up
    Article.find_each do |article|
      article.update(url: article.generate_url_from_title)
    end
  end

  def down
    Article.update_all(url: '')
  end
end
