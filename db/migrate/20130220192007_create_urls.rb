class CreateUrls < ActiveRecord::Migration
  
  def change
    create_table :urls do |u|
      u.string  :long
      u.string  :short
      u.integer :click_count, :default => 0
      u.integer :user_id
    end
  end

end
