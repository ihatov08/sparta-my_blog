class Post < ActiveRecord::Base
  # paginates_per 2

  # def self.find_newest_article
  #   Post.order(created_at: :DESC).limit(5)
  # end
end
