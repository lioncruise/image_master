class AddMd5ToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :md5, :text
  end
end
