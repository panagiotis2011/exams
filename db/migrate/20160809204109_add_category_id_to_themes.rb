class AddCategoryIdToThemes < ActiveRecord::Migration[5.0]
  def change
    add_column :themes, :category_id, :integer
  end
end
