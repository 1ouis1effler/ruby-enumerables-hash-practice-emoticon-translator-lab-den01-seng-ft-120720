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
  japanese_emoticon = emoticon_lib.keys.find do | key |
     emoticon_lib[key][:english] == emoticon
  end
  japanese_emoticon ? emoticon_lib[japanese_emoticon][:japanese] : 'Sorry, that emoticon was not found'
  #binding.pry 
end

def get_english_meaning(path, emoticon)
  emoji = load_library(path)
  if emoji["get_meaning"].has_key?(emoticon)
    emoji["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
