class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.string :file

      t.timestamps
    end
  end
end
