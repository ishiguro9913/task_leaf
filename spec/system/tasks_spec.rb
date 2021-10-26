require 'rails_helper'

describe 'タスク管理機能', type: :system do
    describe '一覧表示機能' do
        let(:user_a) {FactoryBot.create(:user, name:'ユーザーA', email: 'a@example.com')}
        let(:user_b) {FactoryBot.create(:user, name:'ユーザーB', email: 'b@example.com')}
        # let(:task_a) {FactoryBot.create(:task, name:'最初のタスク', user: user_a)} 

        before do
            # ユーザーAを作成しておく
            # user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
            # 作成者がユーザーAであるタスクを作成しておく
            FactoryBot.create(:task, name: '最初のタスク', user:user_a)
            visit login_path
            fill_in 'メールアドレス', with: login_user.email
            fill_in 'パスワード', with: login_user.password
            click_button 'ログインする'
        end
        
    
        context 'ユーザーAがログインしているとき' do
            # login_userをletで定義する
            let(:login_user){ user_a }
            it 'ユーザーAが作成したタスクが表示される' do
                # 作成済みのタスクの名称が画面上に表示されていることを確認
                expect(page).to have_content '最初のタスク'
            end

=begin
            before do
                # ユーザーAでログインする
                visit login_path
                fill_in 'メールアドレス', with: 'a@example.com'
                fill_in 'パスワード', with: 'password'
                click_button 'ログインする'
            end
=end

        end

        context 'ユーザーBがログインしているとき' do
            let(:login_user){ user_b }
            it 'ユーザーAが作成したタスクが表示されない' do
                # ユーザーAが作成したタスクの名称が画面上に表示されないことを確認
                expect(page).not_to have_content '最初のタスク'
            end 
=begin
            before do
                # ユーザーBを作成しておく
                FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com')
                # ユーザーBでログインする
                visit login_path
                fill_in 'メールアドレス', with: 'b@example.com'
                fill_in 'パスワード', with: 'password'
                click_button 'ログインする'
            end
=end

        end
    end
end







