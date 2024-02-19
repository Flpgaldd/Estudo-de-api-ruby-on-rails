class AddFabricanteRefToCarros < ActiveRecord::Migration[7.1]
  def change
    add_reference :carros, :fabricante, null: false, foreign_key: true
  end
end
