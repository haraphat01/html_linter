require 'nokogiri'
require 'colorize'

class Linters
  attr_accessor :document
  def initialize
    @document = Nokogiri::HTML.parse(open('index.html'))
  end

  def functions
    head
    title
    title_length
    h1_tag
    alt_text
  end

  def head
    tit = document.search('head')
    if tit.count <= 1
      puts 'TEST PASSED : '.green + 'Your head tag is one'
    else
      puts 'TEST FAILED : '.red + 'You shouldnt have more than one head'
end
end

  def title
    tit = document.search('title')
    if tit.empty? && tit.text.empty?
      puts 'TEST FAILED : '.red + 'title tag or title text is required in the title tag'
    else
      puts 'TEST PASSED : '.green + 'title tag is present'
    end
  end

  def title_length
    tit = document.search('title')
    if tit.text.length <= 60
      puts 'TEST PASSED : '.green + "Your title's text is normal"
    else
      puts 'TEST FAILED : '.red + "your title's text is too long"
      end
   end

  def h1_tag
    tit = document.search('h1')
    if tit.count <= 1
      puts 'TEST PASSED : '.green + 'Your h1 usage is good'
    else
      puts 'TEST FAILED : '.red + 'You should reduce your h1 to just one'
     end
end

  def alt_text
    tit = document.search('//img[@alt]')
    if tit.empty? != true
      puts 'TEST PASSED : '.green + 'alt text present'

    else
      puts 'TEST FAILED : '.red + 'one of your alt text is missing'
     end
end
end
