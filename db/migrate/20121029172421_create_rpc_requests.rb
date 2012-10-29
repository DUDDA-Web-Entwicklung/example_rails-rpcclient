class CreateRpcRequests < ActiveRecord::Migration
  def change
    create_table :rpc_requests do |t|
      t.string :methodName
      t.text :params

      t.timestamps
    end
  end
end
