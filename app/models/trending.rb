class Trending < ApplicationRecord
    validates_uniqueness_of :title
end
