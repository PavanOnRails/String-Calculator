class StringCalculator
  def add(numbers)
    return 0 if numbers.strip.empty?

    delimiter = /,|\n/

    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      custom_delimiter = delimiter_line[2..]
      delimiter = Regexp.escape(custom_delimiter)
      delimiter = /#{delimiter}/
    end

    nums = numbers.split(delimiter).map(&:to_i)
    nums.sum
  end
end
  