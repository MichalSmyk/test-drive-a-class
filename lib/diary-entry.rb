class DiaryEntry
    def initialize(title, contents) # title, contents are strings
      @title = title
      @contents = contents
    end
  
    def title
      return @title
    end
  
    def contents
      return @contents
    end
  
    def count_words
      @contents.split(' ').count
    end
  
    def reading_time(wpm) 
      
      word_count = wpm.split(" ").count

      time = word_count / 200.to_f

      if word_count == 0
         0
      elsif word_count == 1
        1
      elsif word_count % 200 == 0
         word_count / 200
      else 
         time.ceil
      end

    end
  
    def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.
    end
  end