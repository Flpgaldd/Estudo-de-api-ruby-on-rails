FactoryBot.define do
  factory :fabricante do
    nome { Faker::Company.name }
    # Adicione outros atributos conforme necessário
  end
end
