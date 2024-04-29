import requests
import pickle

s = requests.session()
s.get('https://google.com')
print(s.cookies.get_dict())
