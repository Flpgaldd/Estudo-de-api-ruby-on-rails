class AddNewCampoToCarro < ActiveRecord::Migration[7.1]
  def change
    add_column :carros, :portas, :integer
    add_column :carros, :arcondicionado, :boolean
    add_column :carros, :lugares, :text
    add_column :carros, :portamalas, :text
  end
end
