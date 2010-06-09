class TermCount < ActiveRecord::Base
  belongs_to :term
  validates_presence_of :date, :tweet_id
  validates_uniqueness_of :tweet_id
end
