require 'selenium-webdriver'

class LoginForm
    
    def initialize(driver)
        @driver = driver
    end

    def registering_link
      @driver.find_element(link: "Register")
    end

    def click_register()
        registering_link.click
    end

end