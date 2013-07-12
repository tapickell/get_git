require 'get_a_repo'

describe GetRepo do

  before :each do
    @dirname = "test_dir"
    @get_repo = GetRepo.new("https://github.com/myappleguy/automation_test_repo.git", @dirname)
  end

  it "initializes with a github url" do
    @get_repo.url.should == "https://github.com/myappleguy/automation_test_repo.git"
  end

  it "initializes with a dir name" do
    @get_repo.directory.should == @dirname
  end

  describe "#clone" do
    it "clones the repo into the specified directory" do
      FileUtils.remove_dir(@dirname) if Dir.exists?(@dirname)
      @get_repo.clone
      Dir.entries(@dirname).should_not == []
      FileUtils.remove_dir(@dirname)
    end
  end
end
