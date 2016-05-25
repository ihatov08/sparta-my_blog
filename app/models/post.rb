class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  # paginates_per 2

  # def self.find_newest_article
  #   Post.order(created_at: :DESC).limit(5)
  # end
end
