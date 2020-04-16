require 'nokogiri'
require 'open-uri'

# The URL page srcapped
html_data = open('https://coinmarketcap.com/all/views/all/').read
page = Nokogiri::HTML(html_data)


crypto_names = page.xpath("//td[@class='cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol']/div")
crypto_prices = page.xpath("//td[@class='cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price']/a")




#<td class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"><a href="/currencies/bitcoin-cash/markets/" class="cmc-link">$232.47</a>



def identify_currency(array1)
	
	array1=[]
	crypto_names.each do |crypto_name|
		array1 << crypto_name.text
	
end
#print array1



identify_currency(array1)


def method_name(n)

	array2=[]
	crypto_prices.each do |crypto_price|
		array2 << crypto_price.text
	end

end





#print (hash = Hash[array1.zip(array2)])

#Hash[members.zip(instruments.map {|i| i.split /, /})]





