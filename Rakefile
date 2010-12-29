$:.unshift 'lib'

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -r ./lib/titanium_cli.rb -I ./lib"
end

require 'sdoc_helpers'
desc "Push a new version to Gemcutter"
task :publish do
  require 'titanium_cli/version'

  ver = TitaniumCli::Version

  sh "gem build titanium_cli.gemspec"
  sh "gem push titanium_cli-#{ver}.gem"
  sh "git tag -a -m 'TitaniumCLI v#{ver}' v#{ver}"
  sh "git push origin v#{ver}"
  sh "git push origin master"
  sh "git clean -fd"
  sh "rake pages"
end
