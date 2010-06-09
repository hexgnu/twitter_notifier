class CreateTerms < ActiveRecord::Migration
  def self.up
    create_table :terms do |t|
      t.string :term
      t.float :threshold

      t.timestamps
    end
  end

  def self.down
    drop_table :terms
  end
end
