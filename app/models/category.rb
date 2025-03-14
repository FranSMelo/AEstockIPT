class Category < ApplicationRecord
    has_many :badges, dependent: :destroy
end
