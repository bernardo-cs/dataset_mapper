module DatasetMapper
  # in order to include this module,
  # parent must implemt tweets_file method
  # that returns a file with the dataset tweets
  
  module TweetsFile
    def tweets_number
      tweets_file.count
    end

    def tweets_with_id
      tweets_file.read.split("\n").map{ |l| [l.split(',')[0].to_i, l.split(',')[2] ]}
    end

    def tweets
      tweets_file.read.split("\n").map{ |l| l.split(',')[2] }
    end
  end
end
