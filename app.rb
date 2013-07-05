require 'mongoid'

ENV['MONGOID_ENV'] = 'development'
Mongoid.load!("mongoid.yml")

# MyLife.create!
# MyLife.print

class MyLife
	def self.create!
		hash 		= {
			name: name, 
			event: [
					{
						date: "Sep 15 2013", 
						city: "Torrance",
						geo: [ 123123,
							12312312
						]
					},
					{
						date: "Jun 17 2013", 
						city: "Santa Monica"
						geo: [ 123123,
							123123123
						]
					}]
		}
		Timeline.create!(hash)
	end

	# def self.print
	# 	Timeline.all
	# end
end

class Timeline
	include Mongoid::Document
 	field :name, 	type: String
  	embeds_many :event
end

class Event
	include Mongoid::Document
	field :date,		type: Date 
	field :city, 		type: String
	field :lat, 		type: Float
	field :long, 		type: Float
	embedded_in :timeline
end
