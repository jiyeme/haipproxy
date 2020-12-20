import requests
proxies = {'http': 'http://127.0.0.1:3128'}
resp = requests.get('http://httpbin.org/ip', proxies=proxies, timeout=5)
print(resp.text)
proxies = {'https': 'http://127.0.0.1:3128'}
resp = requests.get('https://httpbin.org/ip', proxies=proxies, timeout=5)
print(resp.text)