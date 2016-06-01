class Job

  attr_reader :id, :title, :description, :salary

  def initialize(hash)
    @id = hash["id"]
    @title = hash["title"]
    @description = hash["description"]
    @salary = hash["salary"]
  end

  def self.find(id)
    job_hash = Unirest.get("#{ENV['DOMAIN']}/jobs/#{id}.json",
    headers: {"Accept" => "application/json",
    "Authorization" => "Token token=#{ENV['TOKEN']}",
    "X-User-Email" => "#{ENV['EMAIL']}"}).body
    return Job.new(job_hash)
  end

  def self.all
    jobs_array = Unirest.get("#{ENV['DOMAIN']}/jobs.json",
    headers: {"Accept" => "application/json",
    "Authorization" => "Token token=#{ENV['TOKEN']}",
    "X-User-Email" => "#{ENV['EMAIL']}"}
    ).body
    jobs = []
    jobs_array.map do |hash|
      jobs << Job.new(hash)
    end
    return jobs
  end

  def destroy
    return Unirest.delete("#{ENV['DOMAIN']}/jobs/#{@id}.json").body
  end

  def update(params)
    return Unirest.patch("#{ENV['DOMAIN']}/jobs/#{@id}.json", headers: {"Accept" => "application/json",
    "Authorization" => "Token token=#{ENV['TOKEN']}",
    "X-User-Email" => "#{ENV['EMAIL']}"}, parameters: { title: params[:title],
                          description: params[:description],
                          salary: params[:salary]
                        }).body
  end

  def self.create(params)
    job_hash =  Unirest.post("#{ENV['DOMAIN']}/jobs/#{@id}.json", headers: {"Accept" => "application/json",
    "Authorization" => "Token token=#{ENV['TOKEN']}",
    "X-User-Email" => "#{ENV['EMAIL']}"}, parameters: { title: params[:title],
                          description: params[:description],
                          salary: params[:salary]
                        }).body
    return Job.new(job_hash)
  end

end
