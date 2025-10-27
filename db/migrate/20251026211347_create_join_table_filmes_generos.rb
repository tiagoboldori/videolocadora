class CreateJoinTableFilmesGeneros < ActiveRecord::Migration[8.1]
  def change
    create_join_table :filmes, :generos do |t|
      # t.index [:filme_id, :genero_id]
      # t.index [:genero_id, :filme_id]
    end
  end
end
