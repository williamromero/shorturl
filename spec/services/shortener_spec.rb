require 'rails_helper'

RSpec.describe Shortener, type: :service do
  let(:link_one) { 'https://www.example.com/articles/how-to-create-a-todo' }
  let(:link_two) { 'https://www.example.com/quotes/tecun-uman-quotes' }

  it "shortener a url to 9 random characters" do
    shortener = Shortener.new(link_one)
    expect(shortener.slug_generator_code.length).to eq(9)
  end
  
  it "set a random characters code to each URL" do
    shortener = Shortener.new(link_one)
    code_link_one = shortener.slug_generator_code

    shortener = Shortener.new(link_two)
    code_link_two = shortener.slug_generator_code

    expect(code_link_two).not_to eq(code_link_one)
  end

  it "maintain the same random characters code to same url" do
    shortener = Shortener.new(link_one)
    code_link_one = shortener.slug_generator_code

    shortener = Shortener.new(link_one)
    code_link_two = shortener.slug_generator_code

    expect(code_link_one).to eq(code_link_two)
  end

end
