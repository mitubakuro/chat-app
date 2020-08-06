require 'rails_helper'

# RSpec.describe Room, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


RSpec.describe Room, type: :model do
  describe '#create' do
    before do
      @room = FactoryBot.build(:room)
    end

    it "nameの値が存在すれば登録できること" do
      @room.name= "roooom"
      expect(@room).to be_valid
    end
    it "nameが空では登録できないこと" do
      @room.name =nil
      # 空の表現はnilの方がよさげ？"""これも同じ気がするけど
      @room.valid?
      expect(@room.errors.full_messages).to include("Name can't be blank")
    end
  end
end