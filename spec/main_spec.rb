require_relative '../lib/linter.rb'
require 'nokogiri'

describe Linters do
let(:document) { Nokogiri::HTML.parse(open('index.html')) }

describe '#head' do
    it 'return true if the head tag is present in the file' do
        tit = document.search('head')
        expect(tit.empty?).to eq false
    end

    it 'return false if the head tag is not present in the file' do
        tit = document.search('head')
        expect(tit.empty?).to eq true
      end
  end

end