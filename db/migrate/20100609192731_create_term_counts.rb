class CreateTermCounts < ActiveRecord::Migration
  def self.up
    create_table :term_counts do |t|
      t.string :term
      t.datetime :date
      t.bignum :tweet_id

      t.timestamps
    end
  end

  def self.down
    drop_table :term_counts
  end
end
