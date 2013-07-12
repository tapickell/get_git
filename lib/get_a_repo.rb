class GetRepo
  attr_reader :url, :directory

  def initialize(url, directory)
    @url = url
    @directory = directory
  end

  def repository_exists?(directory)
    Dir.exists? directory
  end

end
