class CreateVotables < ActiveRecord::Migration
  def change
    create_table :votables do |t|
      t.string :name
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
