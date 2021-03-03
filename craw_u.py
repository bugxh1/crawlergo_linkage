#!/usr/bin/python3
# coding: utf-8
import simplejson
import subprocess
import requests
import warnings
import json
from fake_useragent import UserAgent

ua = UserAgent()
proxy = ''
warnings.filterwarnings(action='ignore')
ua = UserAgent(use_cache_server=False)

def get_random_headers():
    headers = {'User-Agent': ua.random}
    return headers

def craw(data1):
	target = data1
	cmd = ["./crawlergo", "-c", "/root/tools/crawlergo_x_XRAY/chrome-linux/chrome","-t", "20","-f","smart","--fuzz-path","--custom-headers",json.dumps(get_random_headers()), "--push-to-proxy", "http://"+proxy+"/", "--push-pool-max", "10","--output-mode", "json" , target]
	rsp = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	output, error = rsp.communicate()
	try:
		result = simplejson.loads(output.decode().split("--[Mission Complete]--")[1])
	except:
		return
	#print("[scanning]")
	print(result)

		