class CreateTables < ActiveRecord::Migration
  def change
    create_table(:bands) do |t|
      t.column(:name, :string)
    end
    create_table(:venues) do |t|
      t.column(:name, :string)
    end
    create_table(:concerts) do |t|
      t.belongs_to :venue, index: true
      t.belongs_to :band, index: true
    end
  end
end
