 require 'json'
 require 'open-uri'

class GamesController < ApplicationController

  def new
  end

  def score
    @game = params[:game]
    serialized_words = open("https://wagon-dictionary.herokuapp.com/#{@game}").read
    words = JSON.parse(serialized_words)
    bolean = words['found']
    @random = (0...8).map { ('a'..'z').to_a[rand(26)] }.join.split("")
    string = @game
    hash = string.upcase.scan(/\w/).each_with_object(Hash.new(0)) do |char, hash|
    hash[char] += 1
    end
    puts hash

    hash2={}
    string2 = @game
    hash2 = string2.upcase.scan(/\w/).each_with_object(Hash.new(0)) do |char2, hash2|
    hash2[char2] += 1
    end
    puts hash


    if bolean == false
      @wordExist = "Sorry but#{@game} is not an english word"
    elsif bolean2 == false
      @wordExist = "Sorry but#{@game} can't be built out of #{s1}"
    else
      @wordExist = "Congratulations #{@game} is a valid word"
    end
  end
end



