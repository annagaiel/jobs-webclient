class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    job = Job.create({ title: params[:title],
                          description: params[:description],
                          salary: params[:salary]
                        })
    redirect_to "/jobs/#{job.id}"
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update({ title: params[:title],
                          description: params[:description],
                          salary: params[:salary]
                        })
    redirect_to "/jobs/#{@job.id}"
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to "/jobs"
  end
end
