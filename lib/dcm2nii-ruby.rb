require "dcm2nii-ruby/version"
class Dcm2nii
	attr_accessor :options

	def initialize
		@options = {}
	end

	def argument_list
		@options.collect {|k,v| v}.join(' ')
  	end

	def command_line
		raise ArgumentError, "No input file specified." unless @input_dir
		['dcm2nii', argument_list, @input_dir].select{|x| !(x.nil? || x.empty?)}.join(' ')
	end

	def convert!
		puts command_line
		# system command_line
	end

	def input_dir(path)
		@input_dir = path
	end

	# Option Methods
	def anonymize!
		@options[:anonymize] = "-a Y"
	end

	def settings_file(filepath)
		@options[:settings_file] = "-b #{filepath}"
	end

	def collapse_folders!
		@options[:collapse_folders] = "-c Y"
	end

	def date_in_filename!
		@options[:date_in_filename] = "-d Y"
	end

	def events_in_filename!
		@options[:events_in_filename] = "-e Y"
	end

	def source_filename!
		@options[:source_filename] = "-f Y"
	end

	def gzip!
		@options[:gzip] = "-g Y"
	end

	def id_in_filename!
		@options[:id_in_filename] = "-i Y"
	end

	def nifti!
		@options[:nifti] = "-n Y"
	end

	def output_dir(path)
		@options[:output_dir] = "-o #{path}"
	end

	def protocol_in_filename!
		@options[:protocol_in_filename] = "-p Y"
	end

	def reorient!
		@options[:reorient] = "-r Y"
	end

	def spm2_analyze!
		@options[:spm2_analyze] = "-s Y"
	end

	def convert_images!
		@options[:convert_images] = "-v Y"
	end

	def reorient_crop!
		@options[:reorient_crop] = "-x Y"
	end
end
