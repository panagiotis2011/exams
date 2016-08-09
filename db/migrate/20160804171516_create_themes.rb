class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.string :title
      t.text :description
      t.string :topic_url
      t.string :answer_url

      t.timestamps
    end
  end
end
