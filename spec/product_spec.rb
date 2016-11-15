require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'should contain a name' do
      product = Product.new({name: nil})

      expect(product.save).to be(false)
    end
    it 'saves successfully when name is present' do
      product = Product.new(name: "Mop")
      expect(product.save).to be(true)
    end
  end
end