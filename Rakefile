require 'bundler/gem_tasks'
require 'bundler/setup'
require 'rake/testtask'
require 'rubocop/rake_task'

RuboCop::RakeTask.new

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = false
end

task default: [:rubocop, :test]
