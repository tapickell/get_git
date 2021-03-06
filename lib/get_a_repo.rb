#!/usr/bin/env ruby

class GetRepo
  require 'terminal-notifier'
  attr_reader :url, :directory

  def initialize(url, directory)
    @url = url
    @directory = directory
  end

  def clone
    if Dir.exists? @directory
      puts "Removing Directory: #{@directory}"
      FileUtils.remove_dir(@directory)
    end
    `git clone #{@url} #{@directory}`
    if (Dir.exists?(@directory) && !Dir.entries(@directory).empty?)
      TerminalNotifier.notify("The repo was cloned into #{@directory}", title:"GetRepo")
    else
      TerminalNotifier.notify("There was an issue cloning the repo into #{@directory}", title:"GetRepo")
    end
  end
end

repo = GetRepo.new("https://github.com/angular/angular.js.git", "wwt-rocks")
repo.clone
