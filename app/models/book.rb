class Book < ApplicationRecord
    validates :title, presence: true
    validates :category, presence: true
    before_save { title.downcase! }
    before_save { category.downcase! }
    before_save { author.downcase! }
end
