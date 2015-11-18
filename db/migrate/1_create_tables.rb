class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.date :birthday
      t.timestamps
    end

    create_table :pins do |t|
      t.string :title
      t.string :summary 
      t.integer :rating
      t.timestamps
    end

    create_table :comments do |t|
    t.string :summary 
    t.timestamps
    end

  end

end