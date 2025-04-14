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
    negative_numbers = nums.select { |n| n < 0 }

    unless negative_numbers.empty?
      raise "Negative numbers not allowed #{negative_numbers.join(',')}"
    end

    nums.sum
  end
end
  