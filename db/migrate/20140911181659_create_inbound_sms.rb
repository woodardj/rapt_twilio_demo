class CreateInboundSms < ActiveRecord::Migration
  def change
    create_table :inbound_sms do |t|
      t.string :phone
      t.boolean :fulfilled

      t.timestamps
    end
  end
end
