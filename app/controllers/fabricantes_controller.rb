require "pry"
class FabricantesController < ApplicationController
  before_action :set_fabricante, only: %i[ show update destroy ]

  # GET /fabricantes
  def index
    @fabricantes = Fabricante.all

    render json: @fabricantes
  end

  # GET /fabricantes/1
  def show
    render json: @fabricante
  end

  # post /fabricantes
  def create
    @fabricante = Fabricante.new(fabricantes_params)

    if @fabricante.save
      render json: @fabricante, status: :created, location: @fabricante
    else
      render json: @fabricante.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fabricantes/1
  def update
    if @fabricante.update(fabricantes_params)
      render json: @fabricante
    else
      render json: @fabricante.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fabricantes/1
  def destroy
    @fabricante.destroy!
  end

  def buscar
    query = params[:q]
    decoded_filtros = params[:filtros].unpack("m")
    filtros = JSON.parse(decoded_filtros[0])

    fabricante = Fabricante.all

    fabricante = fabricante.where("nome ILIKE ?", "%#{query}%") if query.present?
    fabricante = fabricante.where(cnpj: filtros["cnpj"]) if filtros["cnpj"].present?
    fabricante = fabricante.where("endereco ILIKE ?", "%#{filtros['endereco']}%") if filtros["endereco"].present?
    fabricante = fabricante.where(ano: filtros["ano"]) if filtros["ano"].present?

    render json: fabricante
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_fabricante
    @fabricante = Fabricante.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def fabricantes_params
    params.require(:fabricante).permit(:nome, :cnpj, :endereco, :ano)
  end
end
