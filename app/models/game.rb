class Game < ActiveRecord::Base
	attr_accessible :completed_at, :initial_state, :state
	serialize :initial_state, Grid
	serialize :state, Grid
	validates_presence_of :user_id

	belongs_to :user

	def self.generate(user)
		g = Grid.generate(10)
		user.games.new(:initial_state => g, :state => g)
	end


	def completed?
		! self.state.data.include?(0)
	end
end
