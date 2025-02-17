class AddAdditionalColumnsToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :plutus_accounts, :guid, :string
    add_column :plutus_accounts, :currency, :string
    add_column :plutus_entries, :guid, :string
  end
end
