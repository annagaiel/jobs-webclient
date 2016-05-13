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
    @job = Unirest.post("#{ENV['DOMAIN']}/jobs?title=#{params[:title]}&description=#{params[:description]}&salary=#{params[:salary]}")
    render "http://localhost:3001/jobs/"
  end

end
