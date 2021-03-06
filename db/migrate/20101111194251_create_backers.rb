class CreateBackers < ActiveRecord::Migration

  def self.up

    create_table :backers do |t|
      t.references :project, :null => false
      t.references :user, :null => false
      t.references :reward
      t.decimal :value, :null => false
      t.boolean :confirmed, :null => false, :default => false
      t.timestamp :confirmed_at
      t.timestamps
    end
    
    add_index :backers, :project_id
    add_index :backers, :user_id
    add_index :backers, :reward_id
    add_index :backers, :confirmed
    
  end
  
  def self.down
    
    drop_table :backers
    
  end
  
end
