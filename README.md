# Dcm2nii::Ruby

A Ruby wrapper for the dcm2nii DICOM to NIFTI file conversion utility

## Installation

Add this line to your application's Gemfile:

    gem 'dcm2nii-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dcm2nii-ruby

## Usage

dn = Dcm2nii::Runner.new(input_directory,{options hash})

eg:

dn = Dcm2nii::Runner.new('/Users/simonmd/code/rubycamppus/input/samples/dicom',{reorient_crop:false, reorient:false}) # creates an instance of the DCM2NII runner

dn.command # runs the utility

resulting_file = dn.get_nii # Returns the generated nifti file

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
