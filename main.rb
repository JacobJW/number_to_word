$number_to_word= {
  1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five",
  6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten",
  11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen",
  15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen",
  19 => "nineteen", 20 => "twenty", 30 => "thirty", 40 => "forty",
  50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty",
  90 => "ninety", 100 => "one hundred", 200 => "two hundred",
  300 => "three hundred", 400 => "four hundred", 500 => "five hundred",
  600 => "six hundred", 700 => "seven hundred", 800 => "eight hundred",
  900 => "nine hundred", 1000 => "one thousand"
}

$word_of_numbers = []

def number_to_words(number)
  if number < 20
    # Unique numbers, simple to fetch.
    return $number_to_word.fetch(number)

  elsif (number >= 20) && (number < 100)
    # Checks how many 10's there are.
    first = $number_to_word.fetch(((number / 10) * 10))
    # Checks remainder and assigns it to variable if it exists
    second = $number_to_word.fetch(number % 10) if number % 10 != 0
    #  two cases: x0, xx
    if number % 10 == 0
      return first
    else
      return "#{first} #{second}"
    end

  elsif (number >= 100) && (number < 1000)
    # Checks how many 100's there are
    first = $number_to_word.fetch(((number / 100) * 100))
    # Using remainder here allows us to reuse parts of
    # the code from 20 <= n < 100 case
    remainder = number % 100
    # Handles special case where remainder is a -teens number.
    if (remainder >= 10) && (remainder < 20)
      second = $number_to_word.fetch(remainder)
      return "#{first} and #{second}"
    end
    # Checks how many 10's there are, if remainder is >= 20
    second = $number_to_word.fetch(((remainder / 10) * 10)) if remainder >= 20
    # Checks how many one's there are, if any.
    third = $number_to_word.fetch(remainder % 10) if remainder % 10 != 0
    # three cases: x00, xx0, xxx
    if remainder == 0
      return first
    elsif remainder % 10 == 0
      return "#{first} and #{second}"
    else
      return "#{first} and #{second} #{third}"
    end

  elsif number == 1000
    return $number_to_word.fetch(number)
  end
end
