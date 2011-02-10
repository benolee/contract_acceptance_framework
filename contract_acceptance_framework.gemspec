# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "contract_acceptance_framework/version"

Gem::Specification.new do |s|
  s.name        = "contract_acceptance_framework"
  s.version     = ContractAcceptanceFramework::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Josh Adams"]
  s.email       = ["josh@isotope11.com"]
  s.homepage    = "http://rubygems.org/gems/contract_acceptance_framework"
  s.summary     = %q{Allow rails objects to agree to versioned contracts}

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = "contract_acceptance_framework"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.6"
  s.add_development_dependency "rspec", "~> 2.4.0"
  s.add_development_dependency "sqlite3", "~> 1.3.3"

  s.add_dependency 'activesupport', '~> 3.0.0'
  s.add_dependency 'activerecord', '~> 3.0.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
