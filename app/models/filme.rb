class Filme < ApplicationRecord
  belongs_to :user
  has_many :comentarios, dependent: :destroy

  has_and_belongs_to_many :generos

  has_one_attached :capa

  validates :titulo, presence: true
  validates :sinopse, presence: true
end
