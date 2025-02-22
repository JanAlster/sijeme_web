class Clanek < ApplicationRecord
  has_rich_text :telo_clanku
  has_one_attached :featured_image
  validates :titul, presence: true
end
