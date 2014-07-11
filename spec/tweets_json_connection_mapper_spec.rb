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
end
