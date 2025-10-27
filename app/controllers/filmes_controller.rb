class FilmesController < ApplicationController
  before_action :set_filme, only: [ :show, :edit, :update, :destroy ]
  allow_unauthenticated_access only: %i[ index show ]


  def index
    @filmes = Filme.all

    if params[:titulo].present?
      @filmes = @filmes.where("titulo ILIKE ?", "%#{params[:titulo]}%")
    end

    if params[:diretor].present?
      @filmes = @filmes.where("diretor ILIKE ?", "%#{params[:diretor]}%")
    end

    if params[:data_postagem].present?
      @filmes = @filmes.where("DATE(lancamento) = ?", params[:lancamento])
    end

    @filmes = @filmes.order(created_at: :desc).page(params[:page]).per(6)
  end


  def show
    @comentarios = @filme.comentarios.order(created_at: :desc)
    @comentario = Comentario.new
  end

  def new
    @filme = Filme.new
    @generos = Genero.all
  end

  def create
    @filme = Current.user.filmes.new(filme_params)
    if @filme.save
      redirect_to @filme
    else
      @generos = Genero.all
      render :new
    end
  end

  def update
    if @filme.update(filme_params)
      redirect_to @filme
    else
      @generos = Genero.all
      render :edit
    end
  end

  def edit
    @generos = Genero.all
  end


  def destroy
    @filme.destroy
    redirect_to filmes_path
  end

  private
    def set_filme
      @filme = Filme.find(params[:id])
    end

    def filme_params
      params.require(:filme).permit(
        :titulo,
        :sinopse,
        :diretor,
        :lancamento,
        :duracao,
        :capa,                # caso queira permitir upload da capa
        genero_ids: []        # array de IDs para a relação N:N com gêneros
      )
    end
end
