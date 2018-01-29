#
# Python version 3.6
#
#
#
# Author: Erez Tamam

# Import Modules
import requests
import sys
import json

# Get user Input
elastic_server = input("Elastic server address?\r\n")
elasic_port = input("Elastic server port? \r\n")

# Try server Connection
try:
	server_statuscode = requests.get("http://" + elastic_server + ":" + elasic_port)
except:
	print("Error Connecting to server, please run script again and put correct values")
	sys.exit()

# Check Server Connection
if server_statuscode.status_code != 200:
	print("Server not available please check data provided")
	sys.exit()
server_uri = "http://" + elastic_server + ":" + elasic_port

# Get nodes from elastic server
response = requests.get(server_uri + "/_nodes/_all/name")
json_data = json.loads(response.text)
nodes = []
for curr_node in json_data['nodes'].keys():
	nodes.append(curr_node)
	
# Check abnormal nodes from the elastic server
abnormal_nodes = []
response = requests.get(server_uri + "/_nodes/_all/stats")
json_data = json.loads(response.text)
for current_node in nodes:
	percent_usage = int(json_data['nodes'][current_node]['jvm']['mem']['heap_used_percent'])
	if percent_usage > 90:
		abnormal_nodes.append(current_node)

# Print abnormal nodes
for curr_abnormal_node in abnormal_nodes:
	print(curr_abnormal_node)
	
