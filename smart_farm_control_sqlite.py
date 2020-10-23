import sqlite3
import requests
import json
import datetime
from datetime import date

def logger(message):
    print(str(datetime.datetime.now())+": "+message)

def dict_factory(cursor, row):
    d = {}
    for idx, col in enumerate(cursor.description):
        d[col[0]] = row[idx]
    return d

def getCurrentAge():
     startDateArr = dbGetConfigData("START_DATE").split("/")
     startDate = date(int(startDateArr[2]), int(startDateArr[1]), int(startDateArr[0]))
     
     now = datetime.datetime.now()
     currentDate = date(now.year, now.month, now.day)
     
     delta = currentDate - startDate
     
     logger("Age="+str(delta.days))
     
     return str(delta.days)
    
def dbGetConfigData(configKey):
    cursor = connection.cursor()
    cursor.execute("SELECT CONFIG_VALUE FROM CONFIG_DATA WHERE CONFIG_KEY ='"+configKey+"'")
    result = cursor.fetchone()
    data = json.dumps(result)
    json_data = json.loads(data)
    logger(configKey+"="+json_data["CONFIG_VALUE"])
    return json_data["CONFIG_VALUE"]

def dbGetSensor(sensorNoList, sType):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM SENSOR WHERE NUMBER in ("+sensorNoList+") AND TYPE = '"+sType+"'")
    result = cursor.fetchall()
    data = json.dumps(result)
    json_data = json.loads(data)
    logger("SENSOR=")
    print(json_data)
    return json_data;
    
def dbGetTempControl(day):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM TEMP_CONTROL WHERE DAY ='"+day+"'")
    result = cursor.fetchone()
    data = json.dumps(result)
    json_data = json.loads(data)
    logger("TEMP_CONTROL=")
    print(json_data)
    return json_data
    
def populateSensors(sensorsConfig):
    sensors = []
    for x in range(len(sensorsConfig)):
        s = Sensor(sensorsConfig[x]["NUMBER"], sensorsConfig[x]["TYPE"], sensorsConfig[x]["IP"])
        sensors.insert(x, s)
        print(s)
    return sensors 

class Sensor:
    def __init__(self, number, sType, ip):
        self.number = number
        self.sType = sType
        self.ip = ip
        #response = requests.get(""+ip+"/"+uri)
        #if response.status_code != 200:
        #    print("Error:", response.status_code)
        #jsonData = response.json()
        #self.humidity = jsonData['data']['humidity']
        #self.temperature = jsonData['data']['temperature']
        self.humidity = "85"
        self.temperature = "32.9"
        
    def __repr__(self):
        return "IP:"+self.ip
    def __str__(self):
        if self.sType == "1":
            sensorType = "[Temp, Humi]"
        else:
            sensorType = "[Wind]"
        return "SENSOR "+sensorType+"#"+str(self.number)+" => IP:"+self.ip +"; T="+self.temperature+"; H="+self.humidity

try:
    #Database connection to SQLite3
    connection = sqlite3.connect("farmiot.db")
    connection.row_factory = dict_factory
    
    #Calculate age that how long since start_date (table: CONFIG_DATA) as of today.
    age = getCurrentAge()

    #Get suitable variable of each day from database (table: TEMP_CONTROL)
    temlControl = dbGetTempControl(age)

    #Get sensor configuration from data base (table:SENSOR)
    sensorsConfig = dbGetSensor(temlControl["SENSOR_LIST_TH"], "1")

    #Initiate list of sensor's object that specific for each day
    sensors = populateSensors(sensorsConfig)
    numOfSensor = len(sensorsConfig)
    totTemp = 0
    totHumi = 0
    for s in sensors:
        totTemp += float(s.temperature)
        totHumi += float(s.humidity)

    avgTemp = totTemp/numOfSensor
    avgHumi = totHumi/numOfSensor
    logger("Average Temperature="+str(avgTemp))
    logger("Average Humidity="+str(avgHumi))

    #Control hardware
    if float(avgTemp) > float(temlControl["MAX_TEMP"]):
        print("Temp too hot")
    elif float(avgTemp) < float(temlControl["MIN_TEMP"]):
        print("Temp too cool")
    else:
        print("Temp OK")

except KeyboardInterrupt:
    pass
  
except:  
    logger("Unexpected error:", sys.exc_info()[0])
    raise
    
finally:  
    #print ("Cleanup GPIO")
    #GPIO.cleanup() # this ensures a clean exit  
    logger ("Close Database Connection")
    connection.close()

