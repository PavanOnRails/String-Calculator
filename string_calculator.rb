# frozen_string_literal: true

# StringCalculator performs addition on a string of numbers.
#
# Features:
# - Supports comma (,) and newline (\n) as default delimiters
# - Supports custom single-character delimiters using the format: "//<delimiter>\n<numbers>"
# - Raises an error if negative numbers are present
# - Returns 0 for an empty string
class StringCalculator
  # Adds a string of numbers with support for custom delimiters.
  #
  # @param numbers [String] a string containing numbers separated by delimiters
  # @return [Integer] the sum of the numbers
  # @raise [RuntimeError] if negative numbers are found
  def add(numbers)
    return 0 if numbers.strip.empty?

    delimiter, number_string = extract_delimiter_and_numbers(numbers)
    nums = number_string.split(delimiter).map(&:to_i)

    check_for_negatives(nums)

    nums.sum
  end

  private

  # Extracts delimiter and number portion from the input string.
  #
  # @param input [String] the full input string
  # @return [Array<Regexp, String>] the delimiter as a Regexp and the numbers string
  def extract_delimiter_and_numbers(input)
    if input.start_with?('//')
      delimiter_line, numbers = input.split("\n", 2)
      custom_delimiter = Regexp.escape(delimiter_line[2..])
      [Regexp.new(custom_delimiter), numbers]
    else
      [/[,|\n]/, input]
    end
  end

  # Checks if the numbers array contains negative values and raises an error.
  #
  # @param nums [Array<Integer>] list of integers to check
  # @raise [RuntimeError] if any negative numbers are found
  def check_for_negatives(nums)
    negative_numbers = nums.select(&:negative?)
    return if negative_numbers.empty?

    raise "Negative numbers not allowed #{negative_numbers.join(',')}"
  end
end
