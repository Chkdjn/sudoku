class Grid

	attr_accessor :data

	def initialize(arr)
		self.data = arr
	end

	def self.dump(grid)
		grid.data.join(',')
	end

	def self.load(str)
		return Grid.new(nil) if str.nil?
		Grid.new(str.split(',').map{ |e| e.to_i })
	end

	def get(x, y)
		self.data[9 * y + x]
	end

	def set(x, y, val)
		self.data[9 * y + x] = val.to_i
	end

	def self.generate(n)
		tab = (0..8).to_a.map{|j| (0..8).to_a.map{|i| (j*3+i+j)%9+1}}.flatten

		(0..n-1).each do |i|
			begin
			n = rand(80)
				end while tab[n] == 0
			tab[n] = 0
		end
		Grid.new(tab)
	end
end