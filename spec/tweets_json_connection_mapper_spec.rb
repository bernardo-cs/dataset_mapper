require_relative "../lib/dataset_mapper.rb"

include DatasetMapper

describe TweetsJsonConnection do
  before :each do
    @dataset_path = '/src/thesis/inesc_data_set_sample/decompressed' 
    @base_file = 'tweets01_aaaa'
    @default_data = :with_stem
  end

  describe '#get_id_from_stemmed_text' do
    it "returns the tweet id from the stemmed text" do
      get_id_from_stemmed_text( "paintbrush work ipad sensubrushman" ).should eq(197701817864421376)
    end
  end

  describe '#convert_stemmed_text_to_text' do
    it "looks up in the json file for the original text of the tweet" do
      # Used in order to only load 10 tweets instead of 1GB
      json_tweets( 10 )
      convert_stemmed_text_to_text( "paintbrush work ipad sensubrushman" ).should eq("RT @FastCoDesign: A Paintbrush That Works On The iPad http://t.co/eWjEZAga (@sensubrushman)")
    end
  end
end
