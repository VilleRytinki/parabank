require 'selenium-webdriver'

class SignUpForm

  def initialize(driver)
    @driver = driver

  end

  def first_name_field
    @driver.find_element(id: "customer.firstName")
  end

  def last_name_field
    @driver.find_element(id: "customer.lastName")  
  end

  def address_field
    @driver.find_element(id: "customer.address.street")
  end

  def city_field
    @driver.find_element(id: "customer.address.city")
  end

  def state_field
    @driver.find_element(id: "customer.address.state")
  end

  def zip_code_field
    @driver.find_element(id: "customer.address.zipCode") 
  end

  def phone_number_field
    @driver.find_element(id: "customer.phoneNumber")
  end

  def ssn_field
    @driver.find_element(id: "customer.ssn")
  end

  def username_field
    @driver.find_element(id: "customer.username")
  end

  def password_field
    @driver.find_element(id: "customer.password") 
  end

  def password_confirmation_field
    @driver.find_element(id: "repeatedPassword")  
  end

  def register_button
    @driver.find_element(xpath: "//input[@value='Register']")
  end

  def fill_first_name(first_name)
    first_name_field.send_keys(first_name)
  end

  def fill_last_name(last_name)
    last_name_field.send_keys(last_name)
  end

  def fill_address(address)
    address_field.send_keys(address)
  end

  def fill_city(city)
    city_field.send_keys(city)
  end

  def fill_state(state)
    state_field.send_keys(state)
  end

  def fill_zip_code(zip_code)
    zip_code_field.send_keys(zip_code)
  end

  def fill_phone_number(phone_number)
    phone_number_field.send_keys(phone_number)
  end

  def fill_ssn(ssn)
    ssn_field.send_keys(ssn)
  end

  def fill_username(user_name)
    username_field.send_keys(user_name)
  end

  def fill_password(password)
    password_field.send_keys(password)
  end

  def fill_password_confirmation(password_confirmation)
    password_confirmation_field.send_keys(password_confirmation)  
  end
  
  def register
    register_button.click
  end

end