# Dataset Mapper

![IST Logo](http://tecnico.ulisboa.pt/img/tecnico.png)

Simple modules that map twitter dataset stored in CSV to easy to use arrays. A small resume of the dataset is also computed.

## How to use

Load modules and specify dataset path:

~~~ruby
require_relative "../lib/dataset_mapper.rb"
include DatasetMapper

@dataset_path = '/src/thesis/inesc_data_set_sample/decompressed' 
@base_file = 'tweets01_aaaa'
@default_data = :with_stem
~~~

Get the array of tweets in the dataset:
~~~ruby
tweets       # => array full of tweets
tweets.first # => 'paintbrush work ipad sensubrushman' 
~~~

Get the dataset stats with default values:
~~~ruby
puts inspect_dataset_stats() # =>
# total number of tweets,                 87558
# number of tweets in selected words,     425
# number of words in the dataset,         50880
# number of words used in sample,         18
# number of word ocurrences in sample,    463
# percentil used,                         0.94
# words used,             ["recogn", "bracket", "basket", "mar", "length", "initi", "dye", "eras", "tradit", "liverpol", "delici", "advantag", "robot", "potus", "belief", "volum", "hok", "thirstythursday"]
~~~

It is possible to overwrite the default value of words to be found in the dataset.
The offset percentil where words start to be choosen can also be changed.

~~~ruby
selected_words.size()  #=> whatever number it was before
@percentil              = 0.5
@number_of_words        = 250
selected_words.size()  #=> 250
~~~


## Dataset Format
This code was used with other gems in order to manipulate the initial dataset in json. It expects a dataset with following structure:

![Dataset Files](https://photos-3.dropbox.com/t/0/AAAqwKhNWq4aAAArxp8ZfxgeUvFx6NJojuXBsZvcvJaNfg/12/3217572/png/1024x768/3/1404396000/0/2/Screen%20Shot%202014-07-03%20at%2013.08.24.png/SGXIz-csRI3gIRcBk-L6o3vpuVjRivfFxd3xhZfLvzU)



| Dataset File  | Use             |
|:------------- |:---------------:| 
| tweets01_aaaa      | json file with tweets captured by INESC-id | 
| tweets01\_aaaa\_english\_trimed.csv      | CSV file containing tweets coma separated. Ex: **200740321783578624,ReRoc_Rochi_KTB,females kno yal jus sit nigas job supose** |
| tweets01\_aaaa\_english\_trimed\_with_stem.csv      | Same as above but with stemming applied. Ex: **200740321783578624,ReRoc_Rochi_KTB,femal kno yal jus sit niga job supos**        | 
| *.wcount | file corresponding to the file with same finished with .csv, with the words that appear are summed. Ex (love apeard 4253 times ): **love,4253** | 
| data\_set\_words | all the words that appear in the dataset |


## License

This code is released under the [MIT License](http://www.opensource.org/licenses/MIT).
