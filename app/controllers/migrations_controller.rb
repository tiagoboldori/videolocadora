
class MigrationsController < ApplicationController
  def run
    if Rails.env.production?
      begin
        # Executa todas as migrations pendentes
        ActiveRecord::Base.connection
        ActiveRecord::MigrationContext.new("db/migrate").migrate
        render plain: "Migrations executadas com sucesso!"
      rescue => e
        render plain: "Erro ao rodar migrations: #{e.message}"
      end
    else
      render plain: "Somente produção"
    end
  end
end
