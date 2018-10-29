class Comment < ActiveRecord::Base
  belongs_to :article

  validates :article_id, :presence => true

  def self.for_dashboard
    order('created_at DESC').limit(5).all
  end

  def word_count
    body.split.count
  end

  def self.total_word_count
    # all.inject(0) {|total, a| total += a.word_count }
    Rails.cache.fetch(:total_comments_word_count) do
      # pluck(:body).inject(0) { |total, comment| } total += comment.split.count)
      pluck(:body).join(" ").split.count
    end
  end
end
