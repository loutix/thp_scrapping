require 'nokogiri'
require 'open-uri'


# méthode pour récuper une adresse eamil à partir de l'url d'une mairie
def get_townhall_email(town)
	url = "https://www.annuaire-des-mairies.com/95/" + town + ".html"
	html_data = open(url).read
	page = Nokogiri::HTML(html_data)
	adresse_mail = page.xpath("//section[2]/div/table/tbody/tr[4][@class='txt-primary tr-last']/td[2]").text
	return adresse_mail
end

# méthode pour récupérer un tableau des noms des villes
def get_townhall_list(page)
	html_data = open('https://www.annuaire-des-mairies.com/val-d-oise.html').read
	page = Nokogiri::HTML(html_data)
	list_town = page.xpath("//a[@class='lientxt']")

	array_town = []
	list_town.each do |town|
		array_town << town.text
	end
	return array_town
end

# méthode pour associer dans hash le nom de la ville et l'adresse email
def associate_town_with_email(town_array)
	final_array = []
	town_array.each do |town|
		town_name_formatted = town.downcase.gsub(" ", "-")
		email = get_townhall_email(town_name_formatted)
		my_hash = Hash.new
		my_hash[town] = email
		final_array << my_hash
	end
	return final_array
end

town_array = get_townhall_list('https://www.annuaire-des-mairies.com/val-d-oise.html')
print associate_town_with_email(town_array)