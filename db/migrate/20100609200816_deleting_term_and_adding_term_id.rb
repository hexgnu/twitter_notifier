class DeletingTermAndAddingTermId < ActiveRecord::Migration
  def self.up
    remove_column(:term_counts, :term)
    add_column(:term_counts, :term_id, :integer)
  end

  def self.down
    remove_column(:term_counts, :term_id)
    add_column(:term_counts, :term, :string)
  end
end
