require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'watir'

class HotsController < ApplicationController
  before_action :set_hot, only: [:show, :edit, :update, :destroy]

  # GET /hots
  # GET /hots.json
  def index
    @hots = Hot.all
  end

  def crawlTopic topic, link
    browser = Watir::Browser.new
    browser.goto link
    sleep 2
    page_hot = Nokogiri::HTML(browser.html)
    list_article = page_hot.css('article')
    browser.close
    # puts list_article.count
    # @insert =  list_article[0]
    list_article.each_with_index do |post, num|
      #Lấy nội dụng title
      title = post.css("h1").text

      #Lấy points
      points = post.search(".point").text

      #Lay comment
      comment = post.search(".comment").text

      #Lấy link ảnh từ attributes của thẻ img
      if post.at("video")
        image = post.at("video").attributes["poster"].text
      else
        image = post.at("img").attributes["src"].text
      end

      topic.where(title: title).first_or_create(
        title: title,
        points: points,
        comment: comment,
        image_url:image)
    end
  end

  def crawl
    link_hot = 'https://9gag.com/hot'
    link_trending = 'https://9gag.com/trending'
    link_fresh = 'https://9gag.com/fresh'
    link_cute = 'https://9gag.com/cute'
    # crawlTopic(Hot,link_hot)
    # crawlTopic(Trending,link_trending)
    # crawlTopic(Fresh,link_fresh)
    crawlTopic(Cute,link_cute)
  end
  def dbhot
    @hots = Hot.all
  end
  def dbtrending
    @trending = Trending.all
  end
  def dbfresh
    @fresh = Fresh.all
  end
  def dbcute
    @cutes = Cute.all
  end
  # GET /hots/new
  def new
    @hot = Hot.new
  end

  # GET /hots/1/edit
  def edit
  end

  # POST /hots
  # POST /hots.json
  def create
    @hot = Hot.new(hot_params)

    respond_to do |format|
      if @hot.save
        format.html { redirect_to @hot, notice: 'Hot was successfully created.' }
        format.json { render :show, status: :created, location: @hot }
      else
        format.html { render :new }
        format.json { render json: @hot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hots/1
  # PATCH/PUT /hots/1.json
  def update
    respond_to do |format|
      if @hot.update(hot_params)
        format.html { redirect_to @hot, notice: 'Hot was successfully updated.' }
        format.json { render :show, status: :ok, location: @hot }
      else
        format.html { render :edit }
        format.json { render json: @hot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hots/1
  # DELETE /hots/1.json
  def destroy
    @hot.destroy
    respond_to do |format|
      format.html { redirect_to hots_url, notice: 'Hot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hot
      @hot = Hot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hot_params
      params.require(:hot).permit(:title, :points, :comment, :image_url)
    end
end
