require 'fileutils'

require 'json'

require 'rake'
require 'rake/tasklib'

require 'psgc/import'

module PSGC
  class RakeTask < ::Rake::TaskLib

    def base_dir
      PSGC::Import::Base.dir
    end

    def base_dir=(dir)
      PSGC::Import::Base.dir = dir
    end

    def base_uri
      PSGC::Import::Base.uri
    end

    def base_uri=(uri)
      PSGC::Import::Base.uri = uri
    end

    def initialize(*args)
      yield self if block_given?

      namespace :psgc do

        directory base_dir

        desc 'Fetch PSGC Web pages from nap.psa.gov.ph'
        task :import => base_dir do
          reg = PSGC::Import::ImportRegions.new
          reg.fetch
        end

        desc 'Compute md5 hashes of files under web/'
        task :hashes => base_dir do
          mapped = Dir.entries(base_dir).map {|f|
            unless f.start_with?('.')
              p = File.join(base_dir, f)
              if File.file?(p) && File.size(p) > 0
                hash = Digest::MD5.file(File.join(base_dir, f)).hexdigest
                [f, hash]
              end
            end
          }.compact
          hashes = Hash[mapped]
          File.open("#{base_dir}.CHECKSUMS", 'w') do |f|
            f.write(hashes.to_json)
          end
        end
      end
    end
  end
end
