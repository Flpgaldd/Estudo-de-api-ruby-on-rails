# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# Criação de fabricantes
for i in 1..5
  Fabricante.create(
  nome:Faker::Company.name,
  cnpj:Faker::PhoneNumber.phone_number,
  endereco:Faker::Space.galaxy,
  ano:Faker::Number.between(from: 1995, to: 2023)
  )
end

# Criação de carros
for i in 1..10
  Carro.create(
    nome: Faker::Vehicle.manufacture,
    informacao: Faker::Lorem.sentence,
    portas: Faker::Number.between(from: 2, to: 5),
    portamalas:Faker::Number.between(from: 150, to: 450),
    arcondicionado: Faker::Boolean.boolean,
    lugares: Faker::Number.between(from: 2, to: 7),
    ano:Faker::Number.between(from: 1995, to: 2023),
    fabricante: Fabricante.first
    )
end
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
