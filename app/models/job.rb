class Job

  attr_reader :id, :title, :description, :salary

  def initialize(hash)
    @id = hash["id"]
    @title = hash["title"]
    @description = hash["description"]
    @salary = hash["salary"]
  end


end
