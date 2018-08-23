class Fresh < ApplicationRecord
    validates_uniqueness_of :title
end
