class AddPartyForColumnToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :party_for, :string
  end
end
