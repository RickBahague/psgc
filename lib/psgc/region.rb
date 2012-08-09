require 'yaml'

module PSGC
  class Region < Struct.new :id, :code, :name
    attr_accessor :provinces
    
    def initialize(*args)
      super(*args)
      @provinces = [Province.new]
    end
    
    REGION_DATA = File.join(PSGC::DATA_DIR, 'regions.yml')

    class << self
      def all
        @@all ||= load_regions
      end
      
      private
      
      def load_regions
        regions = []
        File.open(REGION_DATA) do |io|
          YAML::load_documents(io) do |h|
            regions << PSGC::Region.new(h['id'], h['code'], h['name'])
          end
        end
        regions
      end
    end
  end
end
