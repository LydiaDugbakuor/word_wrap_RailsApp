class Wrapper < ApplicationRecord
   # include ActiveModel::Validations
 # include ActiveModel::Model
  # include ActiveModel::Conversion
 #  extend ActiveModel::Naming

  #attr_accessor :inputText, :colNumber
  
 # validates :inputText, presence: true #length: {minimum: 1}
 # validates :colNumber, presence: true# numericality: {only_integer: true}
 
 def self.wrap(text, colNumber)
  text = text.strip 
  
  if text.length <= colNumber
   return text
  end
  
  if text.include? " "    #if the string has spaces within
    spaceIndex = text.index(" ") # get the index of the first space
    if spaceIndex < colNumber  
      while !(text.index(" ", spaceIndex + 1).nil?)  # while other spaces exist 
        if text.index(" ", spaceIndex + 1) <= colNumber 
          spaceIndex = text.index(" ", spaceIndex + 1)# take the index of the next space
        else
          break
        end
      end
      return text[0...spaceIndex] + "\n" + wrap(text[spaceIndex + 1..-1],colNumber)
    else
      return text[0...colNumber] + "\n" + wrap(text[colNumber..-1],colNumber) #wrap up to the column limit
    end
  else
   return text[0...colNumber] + "\n" + wrap(text[colNumber..-1],colNumber)# for strings without spaces
  end
 end
end