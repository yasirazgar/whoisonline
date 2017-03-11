class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      # others
      t.string :first_name,         null: true, default: ""
      t.string :last_name,         null: true, default: ""
      t.integer :status,            null:true, default: 0

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end

  # rake db:migrate:down VERSION=20170310180016
  def down
    drop_table(:users)
  end
end
