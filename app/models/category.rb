class Category < ApplicationRecord
    #a category can be found in many listings
    has_many :listings
end
