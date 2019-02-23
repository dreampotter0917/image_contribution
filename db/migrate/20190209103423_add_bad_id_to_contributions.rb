class AddBadIdToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :bad, :integer, default: 0
  end
end
