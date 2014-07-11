module DatasetMapper
  ## Module that gives methods by merging methods from the jsonfile module
  ## and tweets module. Enables reading of the original text in tweets

  module TweetsJsonConnection
    def get_id_from_stemmed_text text
      tweets_with_id.detect{ |t| t.last == text }.first
    end

    def convert_stemmed_text_to_text text
      get_text_from(get_id_from_stemmed_text( text ))
    end
  end
end
