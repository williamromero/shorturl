require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link_one) { 'https://www.example.com/articles/how-to-create-a-todo' }
  let(:link_two) { 'https://www.example.com/quotes/tecun-uman-quotes' }

  it "always has an original URL" do
    link = Link.new(
      original_url: link_one,
      slug: "012345678"
    )
    expect(link).to be_valid(true)
  end

  it "always has a slug code" do
    link = Link.new(
      original_url: link_one,
      slug: "012345678"
    )
    expect(link).to be_valid(true)    
  end

  it "error if hasn't original_url" do
    link = Link.new(
      slug: "012345678"
    )
    expect(link).to be_valid(false)  
  end


  it "error if hasn't slug code" do
    link = Link.new(
      original_url: link_one,
    )
    expect(link).to be_valid(false)
  end


end
