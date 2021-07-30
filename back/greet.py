from flask import Flask, jsonify
from flask import Flask, request, jsonify
from fake_useragent import UserAgent
import urllib.request as urllib2 
import socket
from flask import Flask, make_response
from urllib.request import urlopen
from json import dumps
import json, re,urllib
import requests
from werkzeug.wrappers import response
from bs4 import BeautifulSoup, SoupStrainer
import json 

app = Flask(__name__)

# url1 = ["google.com"]

# @app.route('/result', methods=['GET', 'POST'])
# def result():
    
#     inputUrl = request.json
#     print(inputUrl)
#     url1.insert(0, inputUrl)
#     return(inputUrl)


@app.route('/sub', methods=['GET', 'POST'])
def index():
    # getUrl = request.json
    # input = url1[0]
    url= "https://crt.sh/?q=google.com&output=json"
    response = urlopen(url)
    data_json = json.loads(response.read())
    a = " "
    for show in data_json:
        a += '\n' +show['common_name']
    return{'result' : a }
    

@app.route('/port', methods=['GET', 'POST'])
def index2():
    # input = url1[0]
    remoteServer    = "www.google.com"
    remoteServerIP  = socket.gethostbyname(remoteServer)

    for port in range(79,81):  
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        result = sock.connect_ex((remoteServerIP, port))
        if result == 0:
             return{'result': port}


@app.route('/dir', methods=['GET', 'POST'])
def index4():
    # input = url1[0]
    url = "http://www.google.com/"
    wordlist = "wordlist.txt"
    fo = open(wordlist,"r+")
    a = ['']
    for i in range(5):
	    word = fo.readline(10).strip()
	    surl = url+word
	    response = requests.get(surl)
	    if (response.status_code == 200):
		     a+= ("[+] 200 OK :- ",surl)
	    else:
		     a+=  ("[-] 400 NOT FOUND :- ",surl)
     
    return{'result': a }
             

@app.route('/broken', methods=['GET', 'POST'])
def index5():
#    input = url1[0]
   url = "http://www.google.com/"
   page = requests.get(url)
   response_code = str(page.status_code)
   data = page.text
   soup = BeautifulSoup(data)
   a = " "
   for link in soup.find_all('a'):
    a+= f"Url: {link.get('href')} " + f"| Status Code: {response_code}"
   return{'result': a}



if __name__ == '__main__':
    app.run(debug=True)



