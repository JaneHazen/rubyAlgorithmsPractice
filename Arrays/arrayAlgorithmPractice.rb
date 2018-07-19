# find longest palindrome 
 def longest_palindrome(string, size = string.length)
  array = string.downcase.chars 
  size.times do  |start|
    break if start + size > string.size
    reverse = string[start, size].reverse 
    if string.include? reverse 
      return reverse
    end 
  end
  longest_palindrome(string, size - 1)
end 

# Find the array that appears once when everything else appears in doubles in order
def find_singleton(array)
  array.each_with_index do |element, index|
    if element != array[index - 1] and element != array[index + 1]
      return element
    end 
  end
  -1
end 

input = [1, 1, 3, 3, 4, 5, 5, 7, 7, 8, 8]
find_singleton(input)

# Find magic index where value at index equals the index
def find_magic_index(array)
  array.each_with_index do |element, index|
    if element == index 
      return element
    end 
  end 
  -1 
end 

input = [-10, -5, 0, 3, 7]
find_magic_index(input)

#Given an array that contains numbers from 1 to n-1 and exactly 1 duplicate, find that duplicate.
def find_duplicate(array)
  numberCount = {}
  array.each do |element|
    if !numberCount[element]
      numberCount[element] = 1
    else 
      return element
    end 
  end 
  -1
end 

def find_duplicate(array)
  array.each_with_index do |element, index|
    if element != index + 1 
      return element
    end 
  end 
end 

input = [1, 2, 3, 4, 5, 3]
find_duplicate(input)

#Search an element in an array where difference between adjacent elements is 1.
def find_first_instance(array, key)
  i = 0
  while i < array.length do 
    if array[i] == key
      return i 
    end 
    i = i + array[i] - key
  end 
  -1
end 

input = [8, 7, 6, 7, 6, 5, 4, 3, 2, 3, 4, 3]
key = 3
find_first_instance(input, key)

def find_restaurant(list1, list2)
    restaurants = {}
    solution = []
    lowest = 
    list2.each_with_index do |name, index|
        restaurants[name] = index
    end
    list1.each_with_index do |name, index|
        if restaurants[name]
            sum = restaurants[name] + index
            p sum
            p lowest

            if sum < lowest 
            p solution
                solution.clear
            p solution
                solution.push(name)
            elsif sum == lowest || lowest ==0
                solution.push(name)
            end 
        end 
    end 
    solution
end



# Given two strings s1 and s2, we will call (s1, s2) a “step”  if you can form s2 by adding exactly one letter to s1 and possibly rearranging the letters of s1.

# For example:
# (of, for) is a step
# (of, if) is not a step, and it is too short
# (of, oct) is not a step

# Given the dictionary we just generated, produce an index
#    w -> {  w1 | (w, w1) is a step }
# that associates to each word all the words that are a step away from it.

# index = step_index(dictionary)


# index['ERA'] = {'AREA', 'BEAR', 'CARE', 'DEAR', 'FEAR', 'HEAR','NEAR','RACE','RARE', 'RATE','READ','REAL','YEAR'}


# index['JOY'] = {}

#    f(dictionary) => index of ALL words, with ALL of their possible steps



require 'net/http'
require 'uri'

def open(url)
  Net::HTTP.get(URI.parse(url))
end


url = 'https://gist.githubusercontent.com/zach-karat/119d690176f324e3f99c0e312f0a6620/raw/82e14d739e966216536ae9806282a20343e0e2f8/google-books-common-words.txt'

# Q1
#
# time complexity:   O( N ) N = all lines of file
# space complexity:  O( N ) N = all lines of file
#
def find_some_number_of_words_by_length(number_of_words, max_length, url)
  page_content = open(url)
  all_lines = page_content.split("\n")
  formatted_lines = []
  all_lines.each do |line|
    each_line = line.split("\t")
    word = each_line[0]
    frequency = each_line[1]
    formatted_lines.push([word, frequency])
  end

  words_of_max_length = []
  formatted_lines.each do |line|
    word = line[0]
    frequency = line[1]
    if word.length <= max_length && word.length >= 2 && words_of_max_length.length < number_of_words
      words_of_max_length.push(line)
    end
  end
  words_of_max_length
end

word_list = find_some_number_of_words_by_length(1000, 5, url)


def find_one_step_away(list_of_words)
  dictionary = {}
  word_array = []
  list_of_words.each do |line|
    word = line[0]
    word_array.push(word)
  end
  word_array.each do |word|
    expected_length = word.length + 1
    word_array.each do |next_word|
      word_letter = []
      if next_word.length == expected_length
        word = word.split("")
        word.each do |letter|
          word_letter.push(letter)
        end
        next_word.each do |letter|
          word_letter.delete_at(word_letter.index(letter) ||word_letter.length)
        end
        if word_letter.length == 0
          if !dictionary[word]
            dictionary[word] = [next_word]
          else
            dictionary[word].push(next_word)
          end
        end
      end
    end
  end
  dictionary
end

p find_one_step_away(word_list)

# puts page_content