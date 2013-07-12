require 'get_a_repo'

describe GetRepo do

  before :each do
    @dirname = "wwt-rocks"
    @get_repo = GetRepo.new("https://github.com/myappleguy/automation_test_repo.git", @dirname)
  end

  it "initializes with a github url" do
    @get_repo.url.should == "https://github.com/myappleguy/automation_test_repo.git"
  end

  it "initializes with a dir name" do
    @get_repo.directory.should == @dirname
  end

  describe "#clone_it" do
  end

  describe "#repository_exists?" do
    it "returns true if the dir exists" do
      FileUtils.mkdir @dirname unless Dir.exists? @dirname
      @get_repo.repository_exists?(@dirname).should == true
      FileUtils.remove_dir @dirname
    end

    it "returns false if the dir doesnt exist" do
      FileUtils.remove_dir @dirname if Dir.exists? @dirname
      @get_repo.repository_exists?(@dirname).should == false
    end
  end

end
