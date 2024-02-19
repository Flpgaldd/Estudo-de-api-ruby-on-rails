FactoryBot.define do
  factory :carro do
    sequence(:nome) { |n| "Carro #{n}" }
    portas { Faker::Number.between(from: 2, to: 5) }
    ano { Faker::Number.between(from: 2000, to: 2023) }
    fabricante { FactoryBot.create(:fabricante) }  # Se você tiver uma fábrica para fabricantes

    # Adicione outros atributos conforme necessário
  end
end
