class Float
	def round_by(increment)
		(self/increment).round * increment
	end
end