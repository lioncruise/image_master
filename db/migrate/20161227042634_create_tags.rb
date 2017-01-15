class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :pictures_tags, id: false do |t|
      t.belongs_to :picture
      t.belongs_to :tag
    end
  end
end
