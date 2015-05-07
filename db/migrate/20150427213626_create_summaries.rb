class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :name
      t.string :description
      t.boolean :public, default: true
      t.string :text

      t.timestamps null: false
    end
  end
end
