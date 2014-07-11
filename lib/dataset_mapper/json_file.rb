require 'json'

module DatasetMapper
  ## Module used to provide methods to interact with the json file
  ## 
  module JsonFile
    def json_file_path
      File.join( @dataset_path, @base_file )
    end

    def json_tweets max_number = nil
      @json_tweets ||= read_file( max_number ).lines.map{ | l | puts "parsing..."; JSON.parse(l)  }
    end

    def get_text_from id
      json_tweets.detect{ |t| t["id"] == id }["text"]
    end

    private
    def read_file max_number
      max_number.nil? ? File.new( json_file_path ) : `head -n #{max_number} #{json_file_path}`
    end
  end
end
