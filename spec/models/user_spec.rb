require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameとemail、passwordとpassword_confirmation、family_name、 first_name、family_name_kana、first_name_kana、birthdayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nicknameが入力されていません。")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Emailが入力されていません。")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Emailは既に使用されています。")
    end

    it 'family_nameが空では登録できないこと' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family nameが入力されていません。")
    end

    it '姓：全角（漢字・ひらがな・カタカナ）以外は登録できないこと' do
      @user.family_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family nameは全角文字を使用してください。")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First nameが入力されていません。")
    end

    it '名：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
      @user.first_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First nameは全角文字を使用してください。")
    end

    it 'family_name_kanaが空では登録できないこと' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanaが入力されていません。")
    end

    it '姓（フリガナ）：全角（カタカナ）以外は登録できないこと' do
      @user.family_name_kana = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanaは全角カナ文字を使用してください。")
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanaが入力されていません。")
    end

    it '名（フリガナ）：全角（カタカナ）以外は登録できないこと' do
      @user.first_name_kana = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanaは全角カナ文字を使用してください。")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthdayが入力されていません。")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordが入力されていません。")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordは6文字以上に設定して下さい。")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmationが内容とあっていません。")
    end

    it 'passwordが英字のみでは登録できないこと' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordには英字と数字の両方を含めて設定してください。")
    end

    it 'passwordが数字のみでは登録できないこと' do
      @user.password = '0000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordには英字と数字の両方を含めて設定してください。")
    end

    it 'passwordが全角では登録できないこと' do
      @user.password = 'パスワード'
      @user.valid?
      expect(@user.errors.full_messages).to include("Passwordには英字と数字の両方を含めて設定してください。")
    end

    it 'emailに＠がない場合登録できないこと' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Emailは有効でありません。")
    end
  end
end