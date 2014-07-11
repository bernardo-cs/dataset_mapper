require_relative "../lib/dataset_mapper.rb"

include DatasetMapper

describe JsonFile do
  before :each do
    @dataset_path = '/src/thesis/inesc_data_set_sample/decompressed' 
    @base_file = 'tweets01_aaaa'
    @default_data = :with_stem
  end

  describe '#json_file_path' do
    it "returns the path to the json file" do
      json_file_path.should eq("/src/thesis/inesc_data_set_sample/decompressed/tweets01_aaaa")
    end
  end

  describe '#json_tweets' do
    it "returns an array of tweets present in the dataset base file, a max number can be passed" do
      json_tweets( 10 ).size.should eq(10)
      json_tweets( 10 ).first.should include("text", "id")
    end
  end

  describe 'get_text_from' do
    it "returns the text of the tweet given a tweet id" do
      json_tweets( 10 )
      get_text_from(197701817864421376).should eq("RT @FastCoDesign: A Paintbrush That Works On The iPad http://t.co/eWjEZAga (@sensubrushman)")
    end
  end

end
