class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|
      t.references :user, foreign_key: true, type: :integer
      t.references :group, foreign_key: true, type: :integer

      t.timestamps
    end
  end
end
