class ComentariosController < ApplicationController
  before_action :set_filme

  def create
    @filme = Filme.find(params[:filme_id])
    @comentario = @filme.comentarios.build(comentario_params)

    if Current.user
      @comentario.user = Current.user
    end


    if @comentario.save
      redirect_to @filme, notice: "Comentário adicionado com sucesso!"
    else
      redirect_to @filme, alert: "Não foi possível salvar o comentário."
    end
  end

  def destroy
    @comentario = Comentario.find(params[:id])
    if @comentario.user == Current.user
      @comentario.destroy
      redirect_to @comentario.filme, notice: "Comentário deletado."
    else
      redirect_to @comentario.filme, alert: "Não autorizado."
    end
  end

  private
    def set_filme
      @filme = Filme.find(params[:filme_id])
    end

    def comentario_params
      params.require(:comentario).permit(:conteudo)
    end
end
