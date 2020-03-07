require 'pry'
require 'yaml'

def load_library(file_path)
  new_hash = {}
  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}
  emoticons_hash = YAML.load_file(file_path)
  emoticons_hash.each do |meaning, emoticons_array|
    #binding.pry
    # If know length of an array, can use this to assign each element a name so that you don't need to keep track of the index. eng = emoticons_array[0] 
    eng, jap = emoticons_array 
    
    # Don't need to create new array to hold japanese emoticons, just need to put it right into the hash as a key and set equal to meaning
    new_hash["get_meaning"][jap] = meaning
    new_hash["get_emoticon"][eng] = jap
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
    emoticons_hash = YAML.load_file(file_path)
    emoticons_hash.each do |meaning, emoticons_array|
      eng, jap = emoticons_array 
        if eng != emoticon
          "Sorry, that emoticon was not found"
        else
          load_library(file_path)['get_emoticon'][emoticon]
         
        end
    end
     binding.pry
end

def get_english_meaning
  # code goes here
end