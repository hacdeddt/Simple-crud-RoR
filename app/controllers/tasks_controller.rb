class TasksController < ApplicationController
	def index
		@task = Task.where(["content LIKE ?","%#{params[:search]}%"]).paginate(page: params[:page], per_page: 3)
	end

	def create
		@task = Task.new(task_params)
		respond_to do |format|
			if @task.save
				format.html {redirect_to @task, notice: 'Task was successfully created.'}
	 		else
	 			format.html {render 'new'}
			end
		end

	end


	def new
		@task = Task.new
	end

	def edit
		@task = Task.find(params[:id])
	end

	def show
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		respond_to do |format|
	 		if @task.update(task_params)
	 			format.html { redirect_to @task, notice: 'Task was successfully updated.' }
	 		else
	 			format.html { render :edit }
	 		end
	 	end
	end

	def destroy
		@task = Task.find(params[:id])
 		@task.destroy
 		respond_to do |format|
 			format.html {redirect_to tasks_path, notice: 'Task was successfully delete.' }
 		end

	end



	private
 		def task_params
 			params.require(:task).permit(:content, :comment, :status)
 		end
end

