class AddArticleIndexToComment < ActiveRecord::Migration
  def change
    add_index :comments, :article_id
  end
end
