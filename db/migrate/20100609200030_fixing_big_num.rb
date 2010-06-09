class FixingBigNum < ActiveRecord::Migration
  def self.up
    add_column(:term_counts, :tweet_id, :integer)
  end

  def self.down
    remove_column(:term_counts, :tweet_id)
  end
end
