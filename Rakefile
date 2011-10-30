require 'rubygems'
require 'hotcocoa/application/builder'

builder = Application::Builder.new 'TwUIExample.appspec'

desc 'Build the application'
task :build do
  builder.build
end

desc 'Build a deployable version of the application'
task :deploy do
  builder.build deploy: true
end

desc 'Build and execute the application'
task :run => [:build] do
  builder.run
end

desc 'Cleanup build files'
task :clean do
  builder.remove_bundle_root
end

namespace :twui do
  task :install do
    sh "cd ../TwUI && xcodebuild -xcconfig ../TwUIExample/TwUI.xcconfig clean"
    sh "cd ../TwUI && xcodebuild -xcconfig ../TwUIExample/TwUI.xcconfig"
    sh "mkdir -p ~/Library/Frameworks/TwUI.framework/Resources/BridgeSupport"
    sh "gen_bridge_metadata -f ~/Library/Frameworks/TwUI.framework -o ~/Library/Frameworks/TwUI.framework/Resources/BridgeSupport/TwUI.bridgesupport"
  end
end

task :default => [:run]
