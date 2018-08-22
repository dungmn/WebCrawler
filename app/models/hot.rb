class Hot < ApplicationRecord
  validates_uniqueness_of :title
end
