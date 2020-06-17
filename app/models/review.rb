class Review < ActiveRecord::Base
    belongs_to :products
    belongs_to :user
end