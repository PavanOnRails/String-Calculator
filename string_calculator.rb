# frozen_string_literal: true

# StringCalculator performs addition on a string of numbers with support for
# custom delimiters and error handling for negative numbers.
class StringCalculator
  def add(numbers)
    return 0 if numbers.strip.empty?

    delimiter, number_string = extract_delimiter_and_numbers(numbers)
    nums = number_string.split(delimiter).map(&:to_i)

    check_for_negatives(nums)

    nums.sum
  end

  private

  def extract_delimiter_and_numbers(input)
    if input.start_with?('//')
      delimiter_line, numbers = input.split("\n", 2)
      custom_delimiter = Regexp.escape(delimiter_line[2..])
      [Regexp.new(custom_delimiter), numbers]
    else
      [/[,|\n]/, input]
    end
  end

  def check_for_negatives(nums)
    negative_numbers = nums.select(&:negative?)
    return if negative_numbers.empty?

    raise "Negative numbers not allowed #{negative_numbers.join(',')}"
  end
end
