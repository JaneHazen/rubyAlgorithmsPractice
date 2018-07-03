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