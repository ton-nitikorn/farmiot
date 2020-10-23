CREATE TABLE TEMP_CONTROL (DAY NUMERIC,MIN_TEMP NUMERIC,MAX_TEMP NUMERIC,MIN_HUMI NUMERIC,MAX_HUMI NUMERIC,MAX_WIND NUMERIC,MAX_FAN NUMERIC,SENSOR_LIST_TH TEXT,SENSOR_LIST_W TEXT);


INSERT INTO TEMP_CONTROL (DAY, MIN_TEMP, MAX_TEMP, MIN_HUMI, MAX_HUMI, MAX_WIND, MAX_FAN, SENSOR_LIST_TH, SENSOR_LIST_W) VALUES
(0, 33, 35, 60, 75, 0.5, 2, '4,5,6', '2'),
(1, 33, 35, 60, 75, 0.5, 2, '4,5,6', '2'),
(2, 33, 35, 60, 75, 0.5, 2, '4,5,6', '2'),
(3, 33, 35, 60, 75, 0.5, 2, '4,5,6', '2'),
(4, 32, 34, 60, 75, 0.5, 2, '4,5,5', '2'),
(5, 32, 34, 60, 75, 0.5, 2, '4,5,5', '2'),
(6, 32, 34, 60, 75, 0.5, 2, '4,5,5', '2'),
(7, 31, 33, 60, 75, 1, 4, '4,5,6,7,8,9', '2,3'),
(8, 31, 33, 60, 75, 1, 4, '4,5,6,7,8,9', '2,3'),
(9, 31, 33, 60, 75, 1, 4, '4,5,6,7,8,9', '2,3'),
(10, 30, 32, 60, 75, 1, 4, '4,5,6,7,8,9', '2,3'),
(11, 30, 32, 60, 75, 1, 4, '4,5,6,7,8,9', '2,3'),
(12, 30, 32, 60, 75, 1, 4, '4,5,6,7,8,9', '2,3'),
(13, 29, 31, 60, 75, 1.5, 6, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(14, 29, 31, 60, 75, 1.5, 6, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(15, 29, 31, 60, 75, 1.5, 6, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(16, 28, 30, 60, 75, 1.5, 6, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(17, 28, 30, 60, 75, 1.5, 6, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(18, 28, 30, 60, 75, 1.5, 6, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(19, 28, 30, 60, 75, 1.5, 6, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(20, 28, 30, 60, 75, 1.5, 6, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(21, 28, 30, 60, 75, 1.5, 6, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(22, 28, 30, 60, 75, 1.5, 6, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(23, 27, 29, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(24, 27, 29, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(25, 27, 29, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(26, 27, 29, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(27, 27, 29, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(28, 27, 29, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(29, 27, 29, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(30, 26, 28, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(31, 26, 28, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(32, 26, 28, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(33, 26, 28, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(34, 26, 28, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(35, 26, 28, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(36, 26, 28, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(37, 26, 28, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3'),
(38, 25, 27, 60, 75, 2, 8, '1,2,3,4,5,6,7,8,9', '1,2,3');


CREATE TABLE SENSOR (
  ID INTEGER PRIMARY KEY,
  NUMBER INTEGER,
  Description TEXT,
  TYPE TEXT,
  IP TEXT
);

INSERT INTO SENSOR (ID, NUMBER, Description, TYPE, IP) VALUES
(1, 1, 'Sensor Temperature/Humidity No.1', 1, '102.168.1.108'),
(2, 2, 'Sensor Temperature/Humidity No.2', 1, '102.168.1.121'),
(3, 3, 'Sensor Temperature/Humidity No.3', 1, '102.168.1.110'),
(4, 4, 'Sensor Temperature/Humidity No.4', 1, '102.168.1.111'),
(5, 5, 'Sensor Temperature/Humidity No.5', 1, '102.168.1.107'),
(6, 6, 'Sensor Temperature/Humidity No.6', 1, '102.168.1.106'),
(7, 7, 'Sensor Temperature/Humidity No.7', 1, '102.168.1.101'),
(8, 8, 'Sensor Temperature/Humidity No.8', 1, '102.168.1.105'),
(9, 9, 'Sensor Temperature/Humidity No.9', 1, '102.168.1.112'),
(10, 1, 'Sensor Wind No.1', 2, '102.168.1.113'),
(11, 2, 'Sensor Wind No.2', 2, '102.168.1.114'),
(12, 3, 'Sensor Wind No.3', 2, '102.168.1.117');


CREATE TABLE CONFIG_DATA (
  CONFIG_KEY TEXT,
  CONFIG_VALUE TEXT
);

INSERT INTO CONFIG_DATA (CONFIG_KEY, CONFIG_VALUE) VALUES
('START_DATE', '20/10/2020'),
('END_DATE', '03/12/2020');

CREATE TABLE FARM_SYSTEM_STATUS (
	HW_CODE	INTEGER,
	STATUS	INTEGER,
	LAST_UPDATE	DATETIME
);

CREATE TABLE HARDWARE_CONTROL (
	ID	INTEGER,
	DESCRIPTION	TEXT,
	PIN_MAP	INTEGER,
	HW_CODE	TEXT,
	PRIMARY KEY("ID" AUTOINCREMENT)
);

INSERT INTO HARDWARE_CONTROL (DESCRIPTION, PIN_MAP, HW_CODE) VALUES
('Heater No.1', 17, 'HE01'),
('Pump No.1', 27, 'PU01'),
('FAN No.1', 22, 'FA01'),
('FAN No.2', 5, 'FA02'),
('FAN No.3', 6, 'FA03'),
('FAN No.4', 13, 'FA04'),
('FAN No.5', 26, 'FA05'),
('FAN No.6', 23, 'FA06'),
('FAN No.7', 24, 'FA07'),
('FAN No.8', 25, 'FA08')
