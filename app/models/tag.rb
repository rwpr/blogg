class Tag < ActiveRecord::Base
  has_many :post_tags # to access post.post_tags
  has_many :posts, through: :post_tags # to access @post.tags
end
