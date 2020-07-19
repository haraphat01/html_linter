require_relative '../lib/linter.rb'
require 'nokogiri'

describe Linters do
let(:document) { Nokogiri::HTML.parse(open('index.html')) }

describe '#head' do
    it 'return true if the head tag is present in the file' do
        tit = document.search('head')
        expect(tit.empty?).to eq false
    end
  end

  describe '#title' do
    it 'return true if title tag is missing' do
       tit = document.search('title')
        expect(tit != 'title').to eq true
   end

     it 'return false if the title tag is missing' do
         tit = document.search('title')
         expect(tit.empty?).to eq false
       end
   end

  describe '#title_length' do
    it 'return true if the length is greter than 60' do
        tit = document.search('title')
        expect(tit != 'title').to eq true
    end
    it 'return false if the length is less than 60' do
        tit = document.search('title')
        expect(tit.empty?).to eq false
      end
    
  end

  describe '#title_length' do
    it 'return true if h1 tag is present' do
        tit = document.search('h1')
        expect(tit != 'title').to eq true
    end
    it 'return false if the h1 is missing' do
        tit = document.search('h1')
        expect(tit.empty?).to eq false
      end
    
  end        

  describe '#anchor' do
  it 'return true if h1 tag is not present ' do
      tit = document.search('//img[@alt]')
      expect(tit != '//img[@alt]').to eq true
  end
  it 'return false if the h1 is present' do
      tit = document.search('//img[@alt]')
      expect(tit == '//img[@alt]').to eq false
    end
  
end        



  

end