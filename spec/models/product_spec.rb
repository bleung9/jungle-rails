require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do
    subject { described_class.new(name: "Pikachu",
                                  price: 9001,
                                  quantity: 9002,
                                  category: Category.create(name: "test"))
    }

    it "should save properly if it has all 4 required attributes" do
      subject.save
      expect(subject).to be_valid
    end

    it "shouldn't be valid if it has no name" do
      subject.name = nil
      subject.save!
      # expect(subject).target.errors.full_messages
    end

    it "shouldn't be valid if it has no price" do
      subject.price_cents = nil
      subject.save!
      # expect(subject).target.errors.full_messages
    end

    it "shouldn't be valid if it has no quantity" do
      subject.quantity = nil
      subject.save!
      # expect(subject).target.errors.full_messages
    end
    
    it "shouldn't be valid if it has no category" do
      subject.category = nil
      subject.save!
      # expect(subject).target.errors.full_messages
    end
    

  end

end
