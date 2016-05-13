class JobsController < ApplicationController

  def index
    @jobs = Unirest.get("#{ENV['DOMAIN']}/jobs.json").body
  end

  def new
  end

  def show
    @job = Unirest.get("#{ENV['DOMAIN']}/jobs/#{params[:id]}.json").body
  end

  def create
    @job = Unirest.post("#{ENV['DOMAIN']}/jobs.json", headers: {"Accept" => "application/json"}, parameters:
                        { title: params[:title],
                          description: params[:description],
                          salary: params[:salary]
                        }).body
    redirect_to "/jobs/#{@job['id']}"
  end

  def edit
    @job = Unirest.get("#{ENV['DOMAIN']}/jobs/#{params[:id]}.json").body
  end

  def update
    @job = Unirest.patch("#{ENV['DOMAIN']}/jobs/#{params[:id]}.json", headers: {"Accept" => "application/json"}, parameters:
                        { title: params[:title],
                          description: params[:description],
                          salary: params[:salary]
                        }).body
    redirect_to "/jobs/#{@job['id']}"
  end

  def destroy
    @job = Unirest.delete("#{ENV['DOMAIN']}/jobs/#{params[:id]}.json").body
    redirect_to "/jobs"
  end
end
