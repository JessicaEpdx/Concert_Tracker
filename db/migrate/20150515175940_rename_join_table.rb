class RenameJoinTable < ActiveRecord::Migration
  def change
    drop_table(:concerts)
    create_table(:bands_venues) do |t|
      t.belongs_to :venue, index: true
      t.belongs_to :band, index: true
    end
  end
end
