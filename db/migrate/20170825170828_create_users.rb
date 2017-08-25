class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false

      t.timestamps
    end

    add_index :users, :email, name: "index_of_users_on_email"
    add_index :users, :session_token, unique: true, name: "index_of_users_on_session_token"
  end
end
