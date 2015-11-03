class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :firstname
      t.string :lastname
      t.timestamps
    end

    create_table :pins do |t|
      t.string :username
      t.string :title
      t.string :summary 
      t.date :postdate
      t.timestamps
    end

    create_table :comments do |t|
    t.string :username
    t.date :postdate
    t.string :content 
    t.timestamps
    end

  end

end