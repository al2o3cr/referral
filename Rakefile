begin
  require "bundler/gem_tasks"
rescue TypeError
  # Support Gel
end

require "rake/testtask"
require "standard/rake"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task default: [:test, "standard:fix"]
