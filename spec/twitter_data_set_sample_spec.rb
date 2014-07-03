require_relative "../lib/dataset_mapper.rb"

include DatasetMapper

describe DatasetMapper do
  before :each do
    @dataset_path = '/src/thesis/inesc_data_set_sample/decompressed' 
    @base_file = 'tweets01_aaaa'
    @default_data = :with_stem
  end

  describe '#word_count_with_stem' do
    it "returns the path associated stemmed file" do
      word_count_with_stem_file_path.should eql('/src/thesis/inesc_data_set_sample/decompressed/tweets01_aaaa_english_trimed_with_stem.wcount')
    end
  end

  describe '#word_count' do
    it "returns the path associated stemmed file" do
      word_count_file_path.should eql('/src/thesis/inesc_data_set_sample/decompressed/tweets01_aaaa_english_trimed.wcount')
    end
  end

  describe '#stemmed_file' do
    it "returns the path associated stemmed file" do
      stemmed_file_path.should eql('/src/thesis/inesc_data_set_sample/decompressed/tweets01_aaaa_english_trimed_with_stem.csv')
    end
  end

  describe '#trimed_file' do
    it "returns the path associated trimmed file" do
      trimed_file_path.should eql('/src/thesis/inesc_data_set_sample/decompressed/tweets01_aaaa_english_trimed.csv')
    end
  end

  describe '#tweets_file' do
    it "returns the file with the tweets" do
      tweets_file.path.should eql('/src/thesis/inesc_data_set_sample/decompressed/tweets01_aaaa_english_trimed_with_stem.csv')  
    end
  end

  describe '#inspect_dataset_stats' do
    it "prints dataset information" do
      inspect_dataset_stats = inspect_dataset_stats()
      inspect_dataset_stats.should match("total number of tweets")
      inspect_dataset_stats.should match("number of tweets in selected words")
      inspect_dataset_stats.should match("number of words in the dataset")
      inspect_dataset_stats.should match("number of words used in sample")
      inspect_dataset_stats.should match("number of word ocurrences in sample")
      inspect_dataset_stats.should match("percentil used")
    end
  end

  describe '#tweets_number' do
    it "returns the number of tweets" do
      tweets_number.should eq(87558)
    end
  end

  describe '#tweets' do
    it "returns an array with all the tweets" do
      tweets.first.should eq('paintbrush work ipad sensubrushman')
      tweets.last.should eq('femal kno yal jus sit amp amp niga job supos')
    end
  end
 describe '#tweets_in_selected_words' do
    it "returns array of tweets in selected words" do
      tweets_in_selected_words.size.should eql(425)
    end
  end 

 describe '#regexp_builder' do
   it "creates a regx to find the words in tweets" do
     regexp_builder.should eql(/\brecogn\b|\bbracket\b|\bbasket\b|\bmar\b|\blength\b|\biniti\b|\bdye\b|\beras\b|\btradit\b|\bliverpol\b|\bdelici\b|\badvantag\b|\brobot\b|\bpotus\b|\bbelief\b|\bvolum\b|\bhok\b|\bthirstythursday\b/)
   end
 end

 describe '#tweets_with_id' do
    it "returns an array with all the tweets and id" do
      tweets_with_id.first.should eq([197701817864421376, "paintbrush work ipad sensubrushman"])
      tweets_with_id.last.should eq([200740321783578624, "femal kno yal jus sit amp amp niga job supos"])
    end
  end 
end
