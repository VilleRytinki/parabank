require 'selenium-webdriver'
require './DataObjects/User.rb'

# frozen_string_literal: true

describe "Parabank" do
  before(:context) do

    @driver = Selenium::WebDriver.for :chrome

    @driver.get("http://localhost:8080/parabank/")
    registering_link = @driver.find_element(link: "Register")

    registering_link.click

    first_name_field = @driver.find_element(id: "customer.firstName")
    last_name_field = @driver.find_element(id: "customer.lastName")
    address_field = @driver.find_element(id: "customer.address.street")
    city_field = @driver.find_element(id: "customer.address.city")
    state_field = @driver.find_element(id: "customer.address.state")
    zip_code_field = @driver.find_element(id: "customer.address.zipCode")
    phone_number_field = @driver.find_element(id: "customer.phoneNumber")
    ssn_field = @driver.find_element(id: "customer.ssn")
    username_field = @driver.find_element(id: "customer.username")
    password_field = @driver.find_element(id: "customer.password")
    password_confirmation_field = @driver.find_element(id: "repeatedPassword")

    @new_user = User.new("Matti", "Meikä", "Kohkokuja 4", "Tampere", "Pirkanmaa", 4328, 0447646652, "201019321")
    @new_user.setup_username("Matti")
    @new_user.setup_password("Hashaha234")

    first_name_field.send_keys(@new_user.first_name)
    last_name_field.send_keys(@new_user.last_name)
    address_field.send_keys(@new_user.address)
    city_field.send_keys(@new_user.city)
    state_field.send_keys(@new_user.state)
    zip_code_field.send_keys(@new_user.zip_code)
    phone_number_field.send_keys(@new_user.phone_number)
    ssn_field.send_keys(@new_user.ssn)
    username_field.send_keys(@new_user.user_name)
    password_field.send_keys(@new_user.password)
    password_confirmation_field.send_keys(@new_user.password)

    register_button = @driver.find_element(xpath: "//input[@value='Register']")

    register_button.click
    sleep 5
  end

  after(:context) do
    @driver.quit
  end

  context "When creating a new user" do
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