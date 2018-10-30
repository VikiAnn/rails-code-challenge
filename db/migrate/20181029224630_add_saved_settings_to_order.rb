class AddSavedSettingsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :saved_settings, :json
  end
end
