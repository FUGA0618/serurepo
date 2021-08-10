# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home', type: :system do
  describe 'ログインせずに/にアクセスした場合' do
    it 'welcome#indexを表示' do
      visit root_path
      expect(page).to have_selector 'h2', text: '「いつか読みたい本」安い時に買いませんか？'
    end
  end

  describe 'ログインして/にアクセスした場合' do
    let(:alice) { create(:alice) }

    it 'home#indexを表示' do
      login(alice)
      visit root_path
      expect(page).to have_selector 'h2', text: '書籍検索'
    end
  end
end
