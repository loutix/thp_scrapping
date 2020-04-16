require 'nokogiri'
require 'open-uri'

# The URL page srcapped
html_data = open('https://coinmarketcap.com/all/views/all/').read
page = Nokogiri::HTML(html_data)


def crypto_name(page)

	crypto_names = page.xpath("//td[@class='cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol']/div")
	
	array_name=[]

	crypto_names.each do |crypto_name|
		array_name << crypto_name.text

	end

	return array_name

end



def crypto_price(page)

	crypto_prices = page.xpath("//td[@class='cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price']/a")
		
	array_price=[]

	crypto_prices.each do |crypto_price|
		array_price << crypto_price.text
	end

	return array_price 	

end


def associate_elements_in_arrays(array1, array2)
	array_total=[]

	array1.count.times do |i|

		my_hash = Hash.new
		my_hash[array1[i]] = array2[i]
		array_total << my_hash	

	end
	return array_total
end
	
array1 = crypto_name(page)
array2 = crypto_price(page)
final_array = associate_elements_in_arrays(array1, array2)
puts final_array