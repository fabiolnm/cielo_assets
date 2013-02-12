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
    Provides basic assets for Cielo form inputs, such as credit card flag icons;
    a helper method that generate inputs and labels for credit card selection;
    and sass styles that makes flag icons behave as radio buttons.
  }

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_development_dependency "sqlite3"
end
