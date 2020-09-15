class AddPasswordDigestToUsers < ActiveRecord::Migration[6.0]
  def change
    # google rails secure password for more details
    add_column :users, :password_digest, :string
  end
end
