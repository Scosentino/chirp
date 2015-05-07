class AddCallSidToChirps < ActiveRecord::Migration
  def change
    add_column :chirps, :call_sid, :string
  end
end
