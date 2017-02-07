class DeleteUsersAgains < ActiveRecord::Migration
  def change
    drop_table :users_agains
  end
end
