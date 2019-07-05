class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :password, :null => false
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :privelages
      t.string :email, :null => false

      t.timestamps
    end
  end
end
