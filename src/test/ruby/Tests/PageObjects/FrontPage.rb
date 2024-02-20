require './PageObjects/SignUpForm.rb'
require './PageObjects/LoginForm.rb'
require 'selenium-webdriver'

class FrontPage

    def initialize(driver)
        @driver = driver
        @signUpForm = SignUpForm.new(driver)
        @loginForm = LoginForm.new(driver)
        @landing_page_url = "http://localhost:8080/parabank/"
    end

    def open
        @driver.get(@landing_page_url)
    end

    def register_new_user(user)
        @loginForm.click_register
        @signUpForm.fill_first_name(user.first_name)
        @signUpForm.fill_last_name(user.last_name)
        @signUpForm.fill_address(user.address)
        @signUpForm.fill_city(user.city)
        @signUpForm.fill_state(user.state)
        @signUpForm.fill_zip_code(user.zip_code)
        @signUpForm.fill_phone_number(user.phone_number)
        @signUpForm.fill_ssn(user.ssn)
        @signUpForm.fill_username(user.user_name)
        @signUpForm.fill_password(user.password)
        @signUpForm.fill_password_confirmation(user.password)
        @signUpForm.register
    end

end
