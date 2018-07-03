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