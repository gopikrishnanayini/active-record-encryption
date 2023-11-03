class StudentsController < ApplicationController
	before_action :set_student, only: %i(show edit update destroy)

	def index
		@students = Student.all.load_async
	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.create(student_params)
		if @student.save
			redirect_to students_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @student.update(student_params)
			redirect_to students_path
		else
			render :edit
		end
	end

	def destroy
		if @student.destroy
			redirect_to students_path
		end
	end

	private

	def student_params
		params.require(:student).permit(:name, :age, :class_name, :address)
	end

	def set_student
		@student = Student.find(params[:id])
	end
end
