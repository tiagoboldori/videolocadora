class AddUserToFilmes < ActiveRecord::Migration[8.1]
  def change
    add_reference :filmes, :user, null: false, foreign_key: true
  end
end
