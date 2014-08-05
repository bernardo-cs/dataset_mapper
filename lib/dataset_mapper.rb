# Module that simplifies data access, based on the convencions used
# in the dataset.
require_relative './dataset_mapper/words_file.rb'
require_relative './dataset_mapper/tweets_file.rb'
require_relative './dataset_mapper/tweets_words_file.rb'
require_relative './dataset_mapper/json_file.rb'
require_relative './dataset_mapper/tweets_json_connection.rb'

module DatasetMapper
  include WordsFile
  include TweetsFile
  include TweetsWordsFile
  include JsonFile
  include TweetsJsonConnection

  # Total number of words from the reference dataset,
  # and offset where words seemed more relevant
  DATASET_CHOOSEN = 2627509.0
  DATASET_TOTAL =  2792045.0
  NUMBER_OF_WORDS = 1000

  ['trimed','stemmed','word_count','word_count_with_stem'].each  do |method_name|
    define_method(method_name + '_file_path') do
      case method_name
      when 'word_count_with_stem'
        File.join( @dataset_path, @base_file + '_english_trimed_with_stem.wcount' )
      when 'word_count'
        File.join( @dataset_path, @base_file + '_english_trimed.wcount' )
      when 'stemmed'
        File.join( @dataset_path, @base_file + '_english_trimed_with_stem.csv' )
      when 'trimed'
        File.join( @dataset_path, @base_file + '_english_trimed.csv' )
      end
    end
  end

  def tweets_file
    File.new(stemmed_file_path)
  end

  def words_file
    File.new(send(  methods.select{ |m| m.match /word_count_#{@default_data.to_s}/ }.first ))
  end

  def inspect_dataset_stats
    "total number of tweets, \t\t"           + tweets_number.to_s                   + "\n" +
    "number of tweets in selected words, \t" + tweets_in_selected_words_number.to_s + "\n" +
    "number of words in the dataset,\t\t"    + words_number.to_s                    + "\n" +
    "number of words used in sample,\t\t"    + number_of_words.to_s                 + "\n" +
    "number of word ocurrences in sample,\t" + sample_number_of_words.to_s          + "\n" +
    "percentil used,\t\t"                    + get_percentil.to_s                   + "\n" +
    "words used,\t\t"                        + selected_words.to_s                  + "\n"
  end
end


