require 'json'
require 'base64'
require 'pry'

dados = { "nome": "João", "idade": 30 }

dados_json = dados.to_json

dados_codificados = Base64.strict_encode64(dados_json)

puts "Dados codificados: #{dados_codificados}"

class CarrosController < ApplicationController
  before_action :set_carro, only: %i[ show update destroy ]

  # GET /carros
  def index
    @carros = Carro.includes(:fabricante).all

    render json: carros_com_fabricantes(@carros)
  end

  # GET /carros/1
  def show
    render json: carro_com_fabricante(@carro)
  end

  # post /carros
  def create
    @carro = Carro.new(carros_params)
    if @carro.save
      render json: @carro, status: :created, location: @carro
    else
      render json: @carro.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carros/1
  def update
    if @carro.update(carros_params)
      render json: @carro
    else
      render json: @carro.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carros/1
  def destroy
    @carro.destroy!
  end

  def buscar
    query = params[:q] # Obtenha o parâmetro de busca da URL

    decoded_filtros = params[:filtros].unpack("m")
    filtros = JSON.parse(decoded_filtros[0])
    @carros = Carro.all

    @carros = @carros.where("nome ILIKE ?", "%#{query}%") if query.present?
    @carros = @carros.where(portas: filtros["portas"].to_i) if filtros["portas"].present?
    @carros = @carros.where(portamalas: filtros["portamalas"].to_i) if filtros["portamalas"].present?
    @carros = @carros.where(arcondicionado: filtros["arcondicionado"]) if filtros["arcondicionado"].present?
    @carros = @carros.where("lugares ILIKE ?", "%#{filtros['lugares']}") if filtros["lugares"].present?
    @carros = @carros.where(ano: filtros["ano"]) if filtros["ano"].present?


    render json: @carros
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_carro
    @carro = Carro.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def carros_params
    params.require(:carro).permit(:nome, :informacao, :ano, :portas, :portamalas, :arcondicionado, :lugares, :fabricante_id)
  end
  def carros_com_fabricantes(carros)
    carros.map do |carro|
      {
        id: carro.id,
        nome: carro.nome,
        informacao: carro.informacao,
        ano: carro.ano,
        portas:carro.portas,
        portamalas:carro.portamalas,
        arcondicionado:carro.arcondicionado,
        lugares:carro.lugares,
        created_at: carro.created_at,
        fabricante: {
          id: carro.fabricante.id,
          nome: carro.fabricante.nome
        }
      }
    end
  end

  def carro_com_fabricante(carro)
    {
      id: carro.id,
      nome: carro.nome,
      informacao: carro.informacao,
      ano: carro.ano,
      portas:carro.portas,
      portamalas:carro.portamalas,
      arcondicionado:carro.arcondicionado,
      lugares:carro.lugares,
      created_at: carro.created_at,
      fabricante: {
        id: carro.fabricante.id,
        nome: carro.fabricante.nome
      }
    }

  end

end
