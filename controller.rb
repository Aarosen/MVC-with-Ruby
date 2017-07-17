require_relative 'model.rb'
require_relative 'view.rb'

class Controller
	def initialize(input)
		@input = input[0]
		@build = Builder.new
		@view = View.new
		@view.menu
	end

	def menu(input, task)
		case @input
		when "add" then add(task)
		when "index" then index
		when "delete" then delete(task.to_i)
		when "complete" then complete(task.to_i)
		end
		
	end

	def index
		@view.index(@build.index)
	end

	def add(task)
		a = @build.add(task)
		@view.add(@build.index)
	end

	def delete(task_id)
		a = @build.delete(task_id)
		@view.delete(@build.index)
	end

	def complete(task_id)
		(@build.complete(task_id))
	end
end

input = ARGV
controller = Controller.new(input)
controller.menu(input, input.drop(1).join(" "))