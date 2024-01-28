class User
    attr_accessor :first_name, :last_name, :address, :city, :state, :zip_code, :phone_number, :ssn
    attr_reader :user_name, :password

    def initialize(first_name, last_name, address, city, state, zip_code, \
        phone_number, ssn)
        @first_name = first_name
        @last_name = last_name
        @address = address
        @city = city
        @state = state
        @zip_code = zip_code
        @phone_number = phone_number
        @ssn = ssn
    end

    public
    def setup_username( user_name )
        @user_name = user_name
    end

    def setup_password( password )
        @password = password
    end

end