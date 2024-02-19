require 'rails_helper'

RSpec.describe Carro, type: :model do
  it "pode ser criado com informações aleatórias" do
    carro = create(:carro)
    expect(carro).to be_valid
    puts "Carro criado: #{carro.nome}, #{carro.portas} portas, #{carro.ano} ano"
  end
end
