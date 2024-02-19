class CreateFabricantes < ActiveRecord::Migration[7.1]
  def change
    create_table :fabricantes do |t|
      t.string :nome
      t.text :cnpj
      t.text :endereco
      t.string :ano

      t.timestamps
    end
  end
end
