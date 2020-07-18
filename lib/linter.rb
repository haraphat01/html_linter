require 'nokogiri'
require 'colorize'

class Linters
    attr_accessor :document
    def initialize
        @document = Nokogiri::HTML.parse(open('index.html'))
    end
    
    def functions
        title
        title_length
        h1_tag
        # alt_text
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
        unless title == true
       puts "Enter a Title"
        case  tit = document.search('title')
        when tit.text.size >= 2
         puts 'TEST FAILED : '.red + 'The title has too many characters, consider reducing it'
        else
         puts 'TEST PASSED : '.green + 'The length is moderate'
        end
     end
    end
    
     
     def h1_tag
         case tit = document.search('h1')
        when tit.count('h1') <= 1
         puts 'TEST FAILED : '.red + 'you should only have one h1 tag'
        else
         puts 'TEST PASSED : '.green + 'your h1 usage is good'
        end
     end
 
  


    
end