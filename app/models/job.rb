class Job

  attr_reader :id, :title, :description, :salary

  def initialize(hash)
    @id = hash["id"]
    @title = hash["title"]
    @description = hash["description"]
    @salary = hash["salary"]
  end

  def self.find(id)
    job_hash = Unirest.get("#{ENV['DOMAIN']}/jobs/#{id}.json").body
    return Job.new(job_hash)
  end

  def self.all
    jobs_array = Unirest.get("#{ENV['DOMAIN']}/jobs.json").body
    return jobs_array.map {|job| Job.new(job) }
  end


end
