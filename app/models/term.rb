class Term < ActiveRecord::Base
  has_many :term_counts
  validates_presence_of :term, :threshold
  validates_format_of :term, :with => /\w+/, :on => :create
  validates_inclusion_of :threshold, :in => 0..100
  
  
end
