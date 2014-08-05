module DatasetMapper
  module WordsFile
    # in order to include this module,
    # parent must implemt words_file method
    # that returns a file with the dataset words

    # @percentil can be explicitlly declared in order to
    # overwrite automatic calculations

    # @number_of_words will force the number of selected words
    # to the choosen number
    def words_number
      words_file.count
    end

    def selected_words
      selected_lines.map{ |w| w.split(',')[0]}
    end

    # aproximate to the biggest dataset values
    def number_of_words
      @number_of_words || ( ( words_number * NUMBER_OF_WORDS )/ DATASET_TOTAL ).round(0)
    end

    def within_range? i
      i.between?( first_line_number, first_line_number + number_of_words )
    end

    def get_percentil
      @percentil || ( DATASET_CHOOSEN / DATASET_TOTAL).round(2)
    end

    def first_line_number percentil = get_percentil
      ( percentil *  words_number).round(0)
    end

    def sample_number_of_words
      selected_lines.inject(0){ |sum, w| sum = sum + w.split(',')[1].to_i}
    end

    def selected_lines
      lines = words_file.read.split("\n")
      (first_line_number ... first_line_number + number_of_words).inject([]){ |arr, n | arr << lines[n]; arr }
    end
  end
end
