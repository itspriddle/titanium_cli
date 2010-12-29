module TitaniumCLI
  module Base
    extend self

    attr_accessor :log, :sdk_root, :sdk_version

    # Copy Titanium logs to this file
    def log
      @log ||= ENV['LOG'] || 'log/development.log'
    end

    # Titanium SDK version
    def sdk_version
      @sdk_version ||= ENV['SDK_VERSION'] || '1.4.2'
    end

    # Titanium SDK root
    def sdk_root
      return @sdk_root if @sdk_root
      case RUBY_PLATFORM
      when /darwin/
        system_root = "/Library/Application Support/Titanium/mobilesdk/osx/#{sdk_version}"
        local_root  = "#{ENV['HOME']}#{system_root}"

        if File.exists?(local_root)
          @sdk_root = local_root
        elsif File.exists?(system_root)
          @sdk_root = system_root
        end
      end

      unless @sdk_root
        raise "Can't find Titanium SDK root"
      end
      @sdk_root
    end

    # Run titanium.py command
    def run(argv)
      if action = argv.shift
        case action.to_sym
        when :create
          create_project(argv) and return
        when :run
          run_project(argv) and return
        else
          raise "Invalid action #{action}" and return
        end
      end
      puts usage.gsub(/^      /, '')
    end

    # Print usage for this script
    def usage; <<-USAGE
      Creating projects:
        Create iPhone project:
          titanium create --platform=iphone --name=FooMobile --id=com.foo.mobile

        Create Android project
          titanium create --platform=android --name=FooMobile \\
                          --id=com.foo.mobile --android=/opt/android-sdk

        Create iPhone and Android project
          titanium create --platform=iphone,android --name=FooMobile \\
                          --id=com.foo.mobile --android=/opt/android-sdk

      Running projects:
        Run iPhone project:
          titanium run --platform=iphone

        Run iPhone project:
          titanium run --platform=android

    USAGE
    end

    # Create project
    # (directory optional)
    #
    # python /Library/Application\ Support/Titanium/mobilesdk/osx/1.4.2/titanium.py create --platform=iphone --name=FooBar --id=com.foobar.baz --directory=.
    # python /Library/Application\ Support/Titanium/mobilesdk/osx/1.4.2/titanium.py create --platform=iphone,android --name=FooBar --id=com.foobar.baz --android=/opt/android-sdk
    def create_project(args)
      bin "create #{args.join(' ')}"
    end

    # Run project
    #
    # python /Library/Application\ Support/Titanium/mobilesdk/osx/1.4.2/titanium.py run --platform=iphone
    # python /Library/Application\ Support/Titanium/mobilesdk/osx/1.4.2/titanium.py run --platform=android
    def run_project(args)
      bin "run #{args.join(' ')} 2>&1 | tee -a #{log}"
    end

  private

    # Runs the titanium.py command
    def bin(command)
      system %{"#{sdk_root}/titanium.py" #{command}}
    end

  end
end
