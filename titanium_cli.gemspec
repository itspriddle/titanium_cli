$:.unshift 'lib'

require 'titanium_cli'

Gem::Specification.new do |s|
  s.name             = 'titanium_cli'
  s.version          = TitaniumCLI::Version
  s.date             = Time.now.strftime('%Y-%m-%d')
  s.summary          = 'Titanium CLI: Create/run Titanium Mobile projects from the command line'
  s.homepage         = 'http://github.com/itspriddle/titanium_cli'
  s.authors          = ['Joshua Priddle']
  s.email            = 'jpriddle@nevercraft.net'

  s.files            = %w[ Rakefile README.markdown ]
  s.files           += Dir['bin/**/*']
  s.files           += Dir['lib/**/*']
  #s.files           += Dir['test/**/*']

  s.executables      = ['titanium']

  # s.add_dependency('gem', '= 0.0.0')

  #s.add_development_dependency('shoulda')

  s.extra_rdoc_files = ['README.markdown']
  s.rdoc_options     = ["--charset=UTF-8"]

  s.description = <<-DESC
    Titanium CLI: Create/run Titanium Mobile projects from the command line
  DESC
end
