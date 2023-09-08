class Market
  attr_reader :id, :name, :street, :city, :state, :zip

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @street = data[:attributes][:street]
    @city = data[:attributes][:city]
    @county = data[:attributes][:county]
    @state = data[:attributes][:state]
    @zip = data[:attributes][:zip]
    @lat = data[:attributes][:lat]
    @lon = data[:attributes][:lon]
    @vendor_count = data[:attributes][:vendor_count]
  end

  def address
    "#{@street}, #{@city}, #{@state} #{@zip}"
  end
end