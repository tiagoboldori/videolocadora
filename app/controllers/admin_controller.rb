
class AdminController < ApplicationController
  def migrate
    if Rails.env.production?
      begin
        ActiveRecord::Migrator.migrate(Rails.application.paths['db/migrate'].to_a, nil)
        render plain: "Migrations rodadas com sucesso!"
      rescue => e
        render plain: "Erro: #{e.message}"
      end
    else
      render plain: "Apenas em produção"
    end
  end
end
