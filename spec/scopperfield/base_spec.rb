require "spec_helper"

describe Scopperfield::Base do
  it "works" do
    Scopperfield::Base.should be_a Module
  end

  describe "initializing" do
    describe "scopperfield_model" do
      it "has appropriate class" do
        Book.scopperfield_model.should be_a Book::Books
      end

      it "has appropriate name" do
        ActiveModel::Naming.param_key(Book::Books).should eq "books"
      end
    end
  end

  describe "simple behavior" do
    let!(:book1){ FactoryGirl.create :book, :cover => 'paper' }
    let!(:book2){ FactoryGirl.create :book, :cover => 'hard' }

    it "uses accessible scope" do
      Book.scopperfield(:paper_covered => true).should include book1
      Book.scopperfield(:paper_covered => true).should_not include book2
    end

    it "is not use accessible scope" do
      Book.scopperfield(:paper_covered => false).should include book1
      Book.scopperfield(:paper_covered => false).should include book2
    end

    it "never uses unaccessible scope" do
      Book.scopperfield(:hard_covered => true).should include book1
      Book.scopperfield(:hard_covered => true).should include book2
    end
  end

  describe "invertible behavior" do
    let!(:book1){ FactoryGirl.create :book, :readed => true }
    let!(:book2){ FactoryGirl.create :book, :readed => false }

    it "uses accessible scope" do
      Book.scopperfield(:readed => true).should include book1
      Book.scopperfield(:readed => true).should_not include book2
    end

    it "uses inverted accessible scope" do
      Book.scopperfield(:readed => false).should_not include book1
      Book.scopperfield(:readed => false).should include book2
    end

  end
end
