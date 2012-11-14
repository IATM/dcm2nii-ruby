require "dcm2nii-ruby/version"

module Dcm2nii

	class Runner
		@@command_path = '/Applications/mricro/dcm2nii'
		@@options_map = { anonymize: '-a',
							settings_file: '-b',
							collapse_folders: '-c',
							date_in_filename: '-d',
							events_in_filename: '-e',
							source_filename: '-f',
							gzip: '-g',
							id_in_filename: '-i',
							nifti: '-n',
							output_dir: '-o',
							protocol_in_filename: 'p',
							reorient: '-r',
							spm2_analyze: '-s',
							convert_images: '-v',
							reorient_crop: '-x'
						}

		def self.command_path=(path)
			@@command_path = path
		end

		def self.command_path
			@@command_path
		end

		def self.options_map
			@@options_map
		end

		def initialize(input_dir, opt = {})
			@input_dir = input_dir
			@opt = opt
		end

		def map_vals(val)
			if val == true || val == false
				val ? 'Y' : 'N'
			else
				val
			end
		end

		def map_options(opt ={})
			opt.inject({}) { |h, (k, v)| h[k] = (self.class.options_map[k] + ' ' + map_vals(v)); h }
		end

		def argument_list
			map_options(@opt).collect {|k,v| v}.join(' ')
		end

		def command
			command_str = "#{self.class.command_path} #{argument_list} #{@input_dir}"
			puts "Running DCM2NII with command #{command_str}"
			result = `#{command_str}`
			exit_code = $?
			case exit_code
				when 0
					puts "Done running DCM2NII."
					return result
				else
					puts "An error ocurred while running DCM2NII"
			        #   exit_error = Dcm2nii::Runner::UnexpectedExitError.new
			        #   exit_error.exit_code = exit_code
			        #   raise exit_error
			        # end
			end
		end

		def get_nii
			if @opt[:output_dir]
				lookup_dir = @opt[:output_dir]
			else
				lookup_dir = @input_dir
			end
			return `find #{lookup_dir} -name *.nii*`.chomp
		end
	end
end
