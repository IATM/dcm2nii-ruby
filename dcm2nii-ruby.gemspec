# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dcm2nii-ruby/version'

Gem::Specification.new do |gem|
  gem.name          = "dcm2nii-ruby"
  gem.version       = Dcm2nii::Runner::VERSION
  gem.authors       = ["Simon Rascovsky"]
  gem.email         = ["investigacion@iatm.com.co"]
  gem.description   = %q{dcm2nii wrapper}
  gem.summary       = %q{Ruby wrapper for the dcm2nii dicom to nifti conversion utility}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end