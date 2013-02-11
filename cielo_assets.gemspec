# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cielo_assets/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cielo_assets"
  s.version     = CieloAssets::VERSION
  s.authors     = ["Fábio Luiz Nery de Miranda"]
  s.email       = ["fabio@miranti.net.br"]
  s.homepage    = "https://github.com/fabiolnm/cielo_assets"
  s.summary     = "Provides basic assets for Cielo form inputs"
  s.description = %{
    This gem contains:
    * Flag Icons for each Supported Credit Card operator, at app/assets/images.
    * Basic Sass styles, for payment method selection based on radio buttons and
    labels whose background is a flag icon.
    * A Helper method, called cielo_controls. Applications should use this helper
    to include Cielo inputs in their forms.
    * A test/dummy application, that can be run with ``` rails s ``` to test this plugin
    * A sample view, that can be accessed at ``` http://localhost:3000/cielo_assets ```,
    with two basic arragement styles for Cielo controls (horizontal and vertical).
  }

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
end
