class Comentario < ApplicationRecord
  belongs_to :user
  belongs_to :filme

  validates :conteudo, presence: true
end
