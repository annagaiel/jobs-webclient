class JobsController < ApplicationController
  before_action :set_url, only: [:index, :show, :create]

  def show
    @job = Unirest.get(@url+"/#{params[:id]}.json").body
  end

  def index
    @jobs = Unirest.get(@url+".json").body
  end

  def new
  end

  def create
    @job = Unirest.post(@url+"?title=#{params[:title]}&description=#{params[:description]}&salary=#{params[:salary]}")
    render "http://localhost:3001/jobs/"
  end

  private
  def set_url
    @url = "http://localhost:3000/api/v1/jobs"
  end
end
