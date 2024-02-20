require 'selenium-webdriver'
require './DataObjects/User.rb'
require './PageObjects/Frontpage.rb'

# frozen_string_literal: true

describe "Parabank" do
  before(:context) do

    @driver = Selenium::WebDriver.for :chrome

    @frontpage = FrontPage.new(@driver)

    @new_user = User.new("Matti", "Meikä", "Kohkokuja 4", "Tampere", "Pirkanmaa", 4328, 0447646652, "201019321")
    @new_user.setup_username("Matti")
    @new_user.setup_password("Hashaha234")

    @frontpage.open
    @frontpage.register_new_user(@new_user)
    
    sleep 5
  end

  after(:context) do
    @driver.quit
  end

  context "When registering as a new user" do
    it "Displays welcome title with users name" do
      welcome_title = @driver.find_element(xpath: "//h1[@class='title']")
      expect(welcome_title.text).to eq("Welcome #{@new_user.first_name}")
    end
    it "Displays successful account creation message" do
      welcome_message= @driver.find_element(xpath: "//div[@id='rightPanel']//p")
      expect(welcome_message.text).to eq("Your account was created successfully. You are now logged in.")
    end
    it "Displays new users firstname and lastname on left panel" do
      welcome_text_left_panel = @driver.find_element(xpath: "//div[@id='leftPanel']//p")
      expect(welcome_text_left_panel.text).to eq("Welcome #{@new_user.user_name} #{@new_user.last_name}")
    end
  end
end