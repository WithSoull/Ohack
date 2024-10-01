import requests

hotels = [["Four season", "Moscow"], ['Raddison Slavyanskaya', 'Moscow']]
comparators = [["yandex travel", "travel.yandex.ru/hotels"], ["mts travel", "travel.mts.ru/hotels"], ["bronevik", "bronevik.com/ru/hotel"]]

for hotel in hotels:
    for comparator in comparators:
        response = requests.get(f'https://google.com/search?q={hotel[0].replace(" ", "+")}+{hotel[1].replace(" ", "+")}+{comparator[0].replace(" ", "+")}')
        text = response.text
        #print(text.count('bronevik.com/ru/hotel'))
        start = text.find("href=\"/url?q=https://" + comparator[1])
        #print(text[start:start+200])
        print(text[start:text.find('&amp', start)])
