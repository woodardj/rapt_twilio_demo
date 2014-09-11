class AddDataToInboundSms < ActiveRecord::Migration
  def change
  	    add_column :inbound_sms, :data, :text
  end
end
