# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'spec_helper'
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  let(:calc) { StringCalculator.new }

  it 'returns 0 for an empty string' do
    expect(calc.add('')).to eq(0)
  end

  it 'returns number for a single number string' do
    expect(calc.add('1')).to eq(1)
  end

  it 'returns the sum of two numbers' do
    expect(calc.add('1,5')).to eq(6)
  end

  it 'returns the sum of multiple numbers' do
    expect(calc.add('1,2,3,4')).to eq(10)
  end

  it 'handles new lines between numbers' do
    expect(calc.add("1\n2,3")).to eq(6)
  end

  it 'supports different delimiters' do
    expect(calc.add("//;\n1;2")).to eq(3)
  end

  it 'raises an error if a negative number is included' do
    expect { calc.add('1,-2,3') }.to raise_error('Negative numbers not allowed -2')
  end

  it 'raises an error listing all negative numbers' do
    expect { calc.add('1,-2,-5,3') }.to raise_error('Negative numbers not allowed -2,-5')
  end
end
