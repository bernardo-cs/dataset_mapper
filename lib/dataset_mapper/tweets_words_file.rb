module DatasetMapper
  #selected words and tweets must be implemented
  module TweetsWordsFile

    def regexp_builder
       /#{selected_words.inject(""){ |sum, w| sum + "\\b" + w + "\\b|"}.chomp("|")}/
    end

    def tweets_in_selected_words
      regx = regexp_builder()
      tweets.select{ |t| t.match(regx) }
    end

    def tweets_in_selected_words_number
      tweets_in_selected_words.count
    end
  end
end
