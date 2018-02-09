require 'rails_helper'

RSpec.describe Memo, type: :model do
  subject {
      User.new(name: "Duncan", email: "dunc@dunc.co")
  }

  describe "Validations" do
      it "is valid with valid attributes" do
          memo = Memo.new(
              title: "My memo",
              date: DateTime.now.utc,
              text_body: "Text body",
              user: subject
          )
          expect(memo).to be_valid
      end

      it "is invalid without a title" do
          bad_memo = Memo.new(
              title: nil,
              date: DateTime.now.utc,
              text_body: "text body",
              user: subject
          )
          expect(bad_memo).to_not be_valid
      end

      it "is invalid without a date" do
          bad_memo = Memo.new(
              title: "My memo",
              date: nil,
              text_body: "text body",
              user: subject
          )
          expect(bad_memo).to_not be_valid
      end

      it "is invalid without a text body" do
          bad_memo = Memo.new(
              title: "My memo",
              date: DateTime.now.utc,
              text_body: nil,
              user: subject
          )
          expect(bad_memo).to_not be_valid
      end

      it "is invalid without a user" do
          bad_memo = Memo.new(
              title: "My memo",
              date: DateTime.now.utc,
              text_body: nil,
              user: subject
          )
          expect(bad_memo).to_not be_valid
      end
  end

  describe "Associations" do
      it "should have many memos" do
          assoc = Memo.reflect_on_association(:user)
          expect(assoc.macro).to eq :belongs_to
      end
  end
end
