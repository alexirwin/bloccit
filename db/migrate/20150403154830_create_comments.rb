class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
			t.references :post, index: true
      t.timestamps
      #t.references :user, index: true
      # add_foreign_key :comments, :users, index: true
    end
    # add_foreign_key :comments, :users
  end
end
