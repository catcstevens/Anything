class AddCategoryToListings < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :categories, foreign_key: true
  end
end
