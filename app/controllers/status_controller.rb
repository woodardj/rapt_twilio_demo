class StatusController < ApplicationController
	def check
		waiting = InboundSms.where(:fulfilled => false)
		puts waiting
		data = "{}"
		data = waiting.first.data if waiting.length > 0
		puts data
		@status = {:status => waiting.length > 0, :data => JSON.parse(data)}
		waiting.each do |i|
			puts "marking #{i} as fulfilled"
			i.update_attributes(:fulfilled => true)
		end
		render json: @status
	end
end
