# MQTT2MySQLBridge

MQTT2MySQLBridge is a project to connect a locally running broker to a MySQL database and store the messages in a database table. The project was written and tested in Python 3.7.3.

[![Build status](https://ci.appveyor.com/api/projects/status/69v4b50ts5639ev4?svg=true)](https://ci.appveyor.com/project/SeppPenner/mqtt2mysqlbridge)
[![GitHub issues](https://img.shields.io/github/issues/SeppPenner/MQTT2MySQLBridge.svg)](https://github.com/SeppPenner/MQTT2MySQLBridge/issues)
[![GitHub forks](https://img.shields.io/github/forks/SeppPenner/MQTT2MySQLBridge.svg)](https://github.com/SeppPenner/MQTT2MySQLBridge/network)
[![GitHub stars](https://img.shields.io/github/stars/SeppPenner/MQTT2MySQLBridge.svg)](https://github.com/SeppPenner/MQTT2MySQLBridge/stargazers)
[![GitHub license](https://img.shields.io/badge/license-AGPL-blue.svg)](https://raw.githubusercontent.com/SeppPenner/MQTT2MySQLBridge/master/License.txt)
[![Known Vulnerabilities](https://snyk.io/test/github/SeppPenner/MQTT2MySQLBridge/badge.svg)](https://snyk.io/test/github/SeppPenner/MQTT2MySQLBridge) 

## Adjust your settings:

* Adjust the broker to the address you want to use: `broker_source`
* Add your custom filters to `filterMessage()` if you want to filter messages
* Adjust your credentials (uncomment if anonymous): 

```python
client_source.username_pw_set("mqtt", "IoT")
```

* Adjust your MySQL credentials:

```python
DatabaseHostName = 'YourHost'
DatabaseUserName = 'YourUser'
DatabasePassword = 'YourPassword'
DatabasePort = 3306
```

* Run the script `SetupDatabase.sql` on your database to setup the database correctly

* Add filters to the bridging like described in the `bridgeFiltering.py` file if needed:

```python
def filterMessage(payload, topic, qos):
	"Filters the messages depending on the configuration for the attributes payload, topic and QoS. 'True' means that the message is not forwarded."
	# Examples below:
	if(payload == "10 %"):
		print('Filtered: payload == "10 %"')
		return True
	if(topic == "humidity" and qos == 0):
		print('Filtered: topic == "humidity" and qos == 0')
		return True
	if(topic == "temperature" or qos == 2):
		print('Filtered: topic == "temperature" or qos == 2')
		return True
	#Add your filters here
```

## Setup on the Raspberry Pi

```bash
sudo apt-get install python3
sudo apt-get install python3-pip
sudo pip3 install paho-mqtt
sudo pip3 install pymysql
```

or

```bash
sudo apt-get install python3
sudo apt-get install python3-pip
sudo pip3 install -r requirements.txt
```

## Running the programms:

```bash
python3 bridge.py
python3 bridgeFiltering.py
```

## Installing the latest version of Python (Currently 3.7.3) on the Raspberry Pi:

https://gist.github.com/SeppPenner/6a5a30ebc8f79936fa136c524417761d

## Paho MQTT client documentation

* https://pypi.org/project/paho-mqtt/
* https://www.hivemq.com/blog/mqtt-client-library-paho-python

## See also

* [MQTT2AWSS3Bridge](https://github.com/SeppPenner/MQTT2AWSS3Bridge)
* [MQTT2PostgresBridge](https://github.com/SeppPenner/MQTT2PostgresBridge)
* [MQTT2MQTTBridge](https://github.com/SeppPenner/MQTT2MQTTBridge)