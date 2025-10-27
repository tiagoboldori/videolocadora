class CreateFilmes < ActiveRecord::Migration[8.1]
  def change
    create_table :filmes do |t|
      t.string :titulo
      t.text :sinopse
      t.string :diretor
      t.date :lancamento
      t.integer :duracao

      t.timestamps
    end
  end
end
