class NewsController < ApplicationController

  # api_key = '42a6e108bb4548cc8d3179d86d554a49'
  # url = 'https://newsapi.org/v2/top-headlines'
  # params = { 'apiKey': api_key, country: 'ph' }
  # response = RestClient.get url, params: params

  def index
    api_key = Rails.application.config_for(:settings)[:news_api][:api_key]
    url = Rails.application.config_for(:settings)[:news_api][:url]
    params = { 'apiKey': api_key, country: 'us' }
    response = RestClient.get url, params: params

    respond_to do |format|
      format.html { @articles = JSON.parse(response.body)['articles'] }
      format.json { render json: JSON.parse(response.body)}
    end

  end
end