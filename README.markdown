# Titanium CLI

This gem allows you to create and run Titanium Mobile projects via the
command line.


## Usage

    Creating projects:
      Create iPhone project:
        titanium create --platform=iphone --name=FooMobile --id=com.foo.mobile

      Create Android project
        titanium create --platform=android --name=FooMobile \
                        --id=com.foo.mobile --android=/opt/android-sdk

      Create iPhone and Android project
        titanium create --platform=iphone,android --name=FooMobile \
                        --id=com.foo.mobile --android=/opt/android-sdk

    Running projects:
      Run iPhone project:
        titanium run --platform=iphone

      Run iPhone project:
        titanium run --platform=android


## Installation

    gem install titanium_cli


## TODO

* Linux/Windows Support


## License

MIT License. See LICENSE in this repo.
