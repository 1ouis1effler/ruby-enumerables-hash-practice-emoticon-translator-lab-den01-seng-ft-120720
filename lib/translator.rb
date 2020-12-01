require 'yaml'
require 'pry'

def load_library(emoticon_file)
  emoticons = YAML.load_file('./lib/emoticons.yml')
 emoticon_lib = { }
  emoticons.each do |meaning, value|
    #binding.pry
    english = value[0]
    japanese = value[1]
    emoticon_lib[meaning]={ }
    emoticon_lib[meaning][:japanese] = japanese
    emoticon_lib[meaning][:english] = english
  end
  emoticon_lib
end

def get_japanese_emoticon(emoticon_file, emoticon)
  emoticon_lib = load_library(emoticon_file)
  emoticon_lib.keys.find do | key |
     emoticon_lib[key]
    binding.pry
  end 
  japanese_emoticon = emoticon_lib['get_emoticon'][emoticon]
  japanese_emoticon ? japanese_emoticon : 'Sorry, that emoticon was not found'
end

def get_english_meaning(emoticon_file, emoticon)
  emoticon_lib = load_library(emoticon_file)
  #binding.pry
  english_meaning = emoticon_lib['get_meaning'][emoticon]
  english_meaning ? english_meaning : 'Sorry, that emoticon was not found'
end