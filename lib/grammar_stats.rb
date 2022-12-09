class GrammarStats
    def initialize
      @text_checked = 0
      @text_failed = 0
      @text_passed = 0
    end
  
      # text is a string
      # Returns true or false depending on whether the text begins with a capital
      # letter and ends with a sentence-ending punctuation mark.

    def check(text) 
        if text == " "
            @text_failed += 1
            return false
        else
            first_letter_is_uppercase = text[0] == text[0].upcase
            last_character_is_valid = [".", "!", "?"].include? text[-1]
           if first_letter_is_uppercase && last_character_is_valid
            @text_passed += 1
            return true
           else
            @text_failed += 1
            return false
           end
        end
    end
  

     # Returns as an integer the percentage of texts checked so far that passed
      # the check defined in the `check` method. The number 55 represents 55%.
    def percentage_good
      @text_checked = @text_passed + @text_failed
      integer_as_percentage = (@text_passed / @text_checked.to_f) * 100
      
      return integer_as_percentage
    end

end  

