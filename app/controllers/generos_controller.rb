class GenerosController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_genero, only: [ :show, :edit, :new, :update, :destroy ]
  def index
    @generos = Genero.all
  end

  def show
    @filmes = @genero.filmes
  end


  def new
    @genero = Genero.new
  end


  def create
    @genero = Genero.new(genero_params)
    if @genero.save
      redirect_to Genero, notice: "Gênero criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end


  def update
    if @genero.update(genero_params)
      redirect_to Genero, notice: "Gênero atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @genero.destroy
    redirect_to generos_path, notice: "Gênero excluído com sucesso."
  end

  private

  def set_genero
    @genero = Genero.find(params[:id])
  end

  def genero_params
    params.require(:genero).permit(:nome)
  end
end
