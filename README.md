# String Calculator

This is a simple implementation of String Calculator using Ruby. The project demonstrates test-driven development principles, clean code practices, and documentation.

---

## What It Does

`StringCalculator` adds numbers provided in a string format, supporting:

- Comma `,` and newline `\n` as default delimiters
- Custom single-character delimiters (e.g. `"//;\n1;2"` returns `3`)
- Error reporting for negative numbers with full listing (e.g. `"1,-2,-5"` raises `negative numbers not allowed -2,-5`)
- Empty input returns `0`

---

## Project Structure

    string_calculator/

    ├── string_calculator.rb # Main implementation

    ├── spec/

      └── string_calculator_spec.rb # RSpec tests
   
      └── spec_helper.rb # Test setup
  
    ├── Gemfile # Dependencies

    ├── README.md # You're here!

    ├── .rspec # RSpec config

## Getting Started

1. Clone the repo:

      ```git clone <git@github.com>:your_username/string_calculator.git```

      ```cd string_calculator```

2. Install dependencies:

      ```ruby bundle install```

3. Run tests:

      ```ruby bundle exec rspec```

## Code Linting (Rubocop)

To check style and formatting:

   ```ruby bundle exec rubocop```

To auto-correct issues:

   ```ruby bundle exec rubocop -A```

## Code Coverage (SimpleCov)

When you run tests, a coverage report is generated at:
/coverage/index.html

Open it in your browser to view detailed coverage metrics.

## Documentation (RDoc)

To generate HTML documentation: ```ruby rdoc string_calculator.rb```

Then open the file: ```bash open doc/index.html```
