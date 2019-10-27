class WrappersController < ApplicationController
  def show
    if params[:inputText] && params[:colNumber]
     @inputTxt = params[:inputText]
     @colNumber = params[:colNumber].to_i
     
     @results = Wrapper.wrap(@inputTxt, @colNumber)
    end 
  end
end
