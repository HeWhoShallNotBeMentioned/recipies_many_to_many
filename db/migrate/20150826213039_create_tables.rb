class CreateTables < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:instructions, :varchar)
      t.column(:recipe_name, :varchar)

      t.timestamps()
    end
  end
end
