class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :number
      t.string :ticket
      t.string :ticket_name
      t.string :ticket_email
      t.string :event
      t.string :void_status
      t.integer :price
      t.string :ticket_reference
      t.string :tags
      t.string :unique_ticket_url
      t.string :unique_order_url
      t.string :order_reference
      t.string :order_name
      t.string :order_email
      t.string :order_ip
      t.datetime :order_date
      t.boolean :attended, :default => false
      t.references :event

      t.timestamps
    end
  end
end
