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

  end
end
