require 'rails_helper'

# RSpec.describe "Users", type: :system do
#   before do
#     driven_by(:rack_test)
#   end

#   pending "add some scenarios (or delete) #{__FILE__}"
# end



RSpec.describe "ユーザーログイン機能", type: :system do
  it 'ログインしていない場合、サインページに移動する' do
    # トップページに遷移する
    visit root_path
    # ログインしていない場合、サインインページに遷移することを期待する
    expect(current_path).to eq new_user_session_path
  end

  it 'ログインに成功し、ルートパスに遷移する' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    # サインインページへ移動する
    visit new_user_session_path
    # ログインしていない場合、サインインページに遷移することを期待する
    expect(current_path).to eq new_user_session_path
    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    # ログインボタンをクリックする
    # find('input[name="commit"]').click　→これでもいいけど新しいメソッドでてきた
    click_on("Log in")
    # ルートページに遷移することを期待する
    expect(current_path).to eq root_path
  end
  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    # トップページに遷移する
    visit root_path
    # ログインしていない場合、サインインページに遷移することを期待する
    expect(current_path).to eq new_user_session_path
    # 誤ったユーザー情報を入力する
    fill_in "Email", with: "111111"
    fill_in "Password", with: "111111"
    # ログインボタンをクリックする
    find('input[name="commit"]').click
    # サインインページに遷移していることを期待する
    expect(current_path).to eq new_user_session_path
  end
end