class View
	def menu
		puts "======================================"
		puts "| Task |    What do you want to do?  |"
		puts "======================================"
		puts "|  1.- |             Add             |"
		puts "|  2.- |            Index            |"
		puts "|  3.- |            Delete           |"
		puts "|  4.- |           Complete          |"
		puts "======================================"
	end

	def index(all)
		all.each_with_index do |x,index|
			output = x.status == "TRUE" ? 'x': ''
			p "#{index+1} [#{output}] " + x.name
		end
	end

	def add(task)
		 task.each_with_index do | x,index|
		 	output = x.status == "TRUE" ? 'x': ''
		 	p "#{index+1} [#{output}] " + x.name
		 end
	end

	def delete(task)
			task.each_with_index do |x,index|
			output = x.status == "TRUE" ? 'x': ''
			p "#{index+1} [#{output}] " + x.name
		end
	end

	def complete(task)
		task
	end
end