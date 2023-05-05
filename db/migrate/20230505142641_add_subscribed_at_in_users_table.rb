class AddSubscribedAtInUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :subscribed_at, :datetime
  end
end
