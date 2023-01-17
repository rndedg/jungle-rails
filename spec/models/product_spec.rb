require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do

    it "should return a valid product with passing validations" do
      @category = Category.new
      yucca = Product.new(
        name: "Yucca",
        description: "A desert plant",
        price_cents: 5000,
        quantity: 10,
        category: @category
      )
      
      expect(yucca).to be_valid
    end

    it "should not validate when no product name given" do
      @category = Category.new
      yucca = Product.new(
        name: nil,
        description: "A desert plant",
        price_cents: 5000,
        quantity: 10,
        category: @category
      )
    
      expect(yucca).to_not be_valid
    end

    it "should not validate when no product price given" do
      @category = Category.new
      yucca = Product.new(
        name: "Yucca",
        description: "A desert plant",
        price_cents: nil,
        quantity: 10,
        category: @category
      )
    
      expect(yucca).to_not be_valid
    end

    it "should not validate when no product quantity given" do
      @category = Category.new
      yucca = Product.new(
        name: "Yucca",
        description: "A desert plant",
        price_cents: 5000,
        quantity: nil,
        category: @category
      )
    
      expect(yucca).to_not be_valid
    end

    it "should not validate when no product category given" do
      @category = Category.new
      yucca = Product.new(
        name: "Yucca",
        description: "A desert plant",
        price_cents: 5000,
        quantity: 10,
        category: nil
      )
    
      expect(yucca).to_not be_valid
    end

  end
end