class ChangeUsersOnlineDefault < ActiveRecord::Migration[5.1]
  def up
    change_column_default(:users, :online, false)
  end

  def down
    change_column_default(:users, :online, true)
  end
end
