class Clanek < ApplicationRecord
  has_rich_text :telo_clanku
  validates :titul, presence: true
end
