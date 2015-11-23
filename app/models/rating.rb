class Rating < ActiveRecord::Base
  # enum severity: [ :PG, :PG13, :R ]
  enum severity: { G: 3, PG: 0, PG13: 1, R: 2, X: 4 }
  belongs_to :topic
  belongs_to :post

  # def self.update_rating(rating_string)
  #
  # end
end
