require 'CSV'

class Task
	attr_accessor :name, :status
	def initialize(name, status = false)
		@name = name
		@status = status
	end

	def complete(status)
		csv_table = CSV.open('model.csv', :headers => false)
		array = csv_table.to_a
	end

end

class Builder
	@@final
	def initialize
		@@final = []
	end

	def index
		brr = []
		@@final = []
		CSV.foreach ('model.csv') do |row|
	        brr << Task.new(row[0], row[1])
	    end
	    brr.each do |x|
	    	@@final << x
	    end
	    @@final
	end

	def add(task)
		p task
		CSV.open('model.csv', "ab") do |csv|
			@@final << Task.new(task)
			@@final.each do |x|
				csv << [x.name, x.status]
			end
	    end
	    @@final
	end

	def delete(task_id)
		p "Estas borrando la tarea #{task_id}"
		array = []
	    list = index
	    list.each_with_index do |item, index| 
	    	if task_id != index + 1
              array << item
	    	end 
	    end
	    CSV.open('model.csv', "w") do |csv|
	    	array.each do |x| 
	    		csv << [x.name, x.status]
	    	end
	    end
	end

	def complete(task_id)
		list = index
		list.each_with_index do |item, index|
			if task_id == index + 1
			    list << item.status = "TRUE"
			end
		end
		CSV.open('model.csv', "w") do |csv|
			list.each do |x|
				csv << [x.name, x.status]
			end
		end
	end
end
