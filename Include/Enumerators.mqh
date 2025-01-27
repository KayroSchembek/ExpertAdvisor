//+------------------------------------------------------------------+
//|                                                      Include.mqh |
//|                                                   Kayro Schembek |
//|                      https://www.mql5.com/pt/users/kayroschembek |
//+------------------------------------------------------------------+
#property copyright "Kayro Schembek"
#property link      "https://www.mql5.com/pt/users/kayroschembek"


enum ENUM_TYPE_TAKEPROFIT
   {
      TAKEPROFIT_NONE,        // Disable
      TAKEPROFIT_POINTS,      // Points
      TAKEPROFIT_PERCENTAGE   // Percentage
   };
enum ENUM_TYPE_STOPLOSS
   {
      STOPLOSS_NONE,          // Disable
      STOPLOSS_POINTS,        // Points
      STOPLOSS_PERCENTAGE     // Percentage   
   };

enum ENUM_TYPE_BREAKEVEN
  {
      BREAKEVEN_NONE,         // Disable
      BREAKEVEN_POINTS,       // Points  
      BREAKEVEN_PERCENTAGE    // Percentage
  };

enum ENUM_TYPE_STEPSTOP
  {
      STEPSTOP_NONE,          // Disable
      STEPSTOP_POINTS,        // Points
      STEPSTOP_PERCENTAGE     // Percentage
  };

enum ENUM_TYPE_ORDER
  {
      ORDER_MARKET,  // Order at Market
      ORDER_PENDING  // Order Pending
  };

enum ENUM_SIGNAL
  {
      SIGNAL_BUY,
      SIGNAL_SELL,
      SIGNAL_NONE
  };


enum ENUM_TYPE_HOUR
   {
      HOUR_COMPLETE,       // Hour Complete
      HOUR_PARTIAL         // Hour Partial
   };

enum ENUM_HOUR_COMPLETE
   {
      COMPLETE_TIME_NULL, // Disabled
      COMPLETE_TIME_0000, // 00:00
      COMPLETE_TIME_0005, // 00:05
      COMPLETE_TIME_0010, // 00:10
      COMPLETE_TIME_0015, // 00:15
      COMPLETE_TIME_0020, // 00:20
      COMPLETE_TIME_0025, // 00:25
      COMPLETE_TIME_0030, // 00:30
      COMPLETE_TIME_0035, // 00:35
      COMPLETE_TIME_0040, // 00:40
      COMPLETE_TIME_0045, // 00:45
      COMPLETE_TIME_0050, // 00:50
      COMPLETE_TIME_0055, // 00:55
      COMPLETE_TIME_0100, // 01:00
      COMPLETE_TIME_0105, // 01:05
      COMPLETE_TIME_0110, // 01:10
      COMPLETE_TIME_0115, // 01:15
      COMPLETE_TIME_0120, // 01:20
      COMPLETE_TIME_0125, // 01:25
      COMPLETE_TIME_0130, // 01:30
      COMPLETE_TIME_0135, // 01:35
      COMPLETE_TIME_0140, // 01:40
      COMPLETE_TIME_0145, // 01:45
      COMPLETE_TIME_0150, // 01:50
      COMPLETE_TIME_0155, // 01:55
      COMPLETE_TIME_0200, // 02:00
      COMPLETE_TIME_0205, // 02:05
      COMPLETE_TIME_0210, // 02:10
      COMPLETE_TIME_0215, // 02:15
      COMPLETE_TIME_0220, // 02:20
      COMPLETE_TIME_0225, // 02:25
      COMPLETE_TIME_0230, // 02:30
      COMPLETE_TIME_0235, // 02:35
      COMPLETE_TIME_0240, // 02:40
      COMPLETE_TIME_0245, // 02:45
      COMPLETE_TIME_0250, // 02:50
      COMPLETE_TIME_0255, // 02:55
      COMPLETE_TIME_0300, // 03:00
      COMPLETE_TIME_0305, // 03:05
      COMPLETE_TIME_0310, // 03:10
      COMPLETE_TIME_0315, // 03:15
      COMPLETE_TIME_0320, // 03:20
      COMPLETE_TIME_0325, // 03:25
      COMPLETE_TIME_0330, // 03:30
      COMPLETE_TIME_0335, // 03:35
      COMPLETE_TIME_0340, // 03:40
      COMPLETE_TIME_0345, // 03:45
      COMPLETE_TIME_0350, // 03:50
      COMPLETE_TIME_0355, // 03:55
      COMPLETE_TIME_0400, // 04:00
      COMPLETE_TIME_0405, // 04:05
      COMPLETE_TIME_0410, // 04:10
      COMPLETE_TIME_0415, // 04:15
      COMPLETE_TIME_0420, // 04:20
      COMPLETE_TIME_0425, // 04:25
      COMPLETE_TIME_0430, // 04:30
      COMPLETE_TIME_0435, // 04:35
      COMPLETE_TIME_0440, // 04:40
      COMPLETE_TIME_0445, // 04:45
      COMPLETE_TIME_0450, // 04:50
      COMPLETE_TIME_0455, // 04:55
      COMPLETE_TIME_0500, // 05:00
      COMPLETE_TIME_0505, // 05:05
      COMPLETE_TIME_0510, // 05:10
      COMPLETE_TIME_0515, // 05:15
      COMPLETE_TIME_0520, // 05:20
      COMPLETE_TIME_0525, // 05:25
      COMPLETE_TIME_0530, // 05:30
      COMPLETE_TIME_0535, // 05:35
      COMPLETE_TIME_0540, // 05:40
      COMPLETE_TIME_0545, // 05:45
      COMPLETE_TIME_0550, // 05:50
      COMPLETE_TIME_0555, // 05:55
      COMPLETE_TIME_0600, // 06:00
      COMPLETE_TIME_0605, // 06:05
      COMPLETE_TIME_0610, // 06:10
      COMPLETE_TIME_0615, // 06:15
      COMPLETE_TIME_0620, // 06:20
      COMPLETE_TIME_0625, // 06:25
      COMPLETE_TIME_0630, // 06:30
      COMPLETE_TIME_0635, // 06:35
      COMPLETE_TIME_0640, // 06:40
      COMPLETE_TIME_0645, // 06:45
      COMPLETE_TIME_0650, // 06:50
      COMPLETE_TIME_0655, // 06:55
      COMPLETE_TIME_0700, // 07:00
      COMPLETE_TIME_0705, // 07:05
      COMPLETE_TIME_0710, // 07:10
      COMPLETE_TIME_0715, // 07:15
      COMPLETE_TIME_0720, // 07:20
      COMPLETE_TIME_0725, // 07:25
      COMPLETE_TIME_0730, // 07:30
      COMPLETE_TIME_0735, // 07:35
      COMPLETE_TIME_0740, // 07:40
      COMPLETE_TIME_0745, // 07:45
      COMPLETE_TIME_0750, // 07:50
      COMPLETE_TIME_0755, // 07:55
      COMPLETE_TIME_0800, // 08:00
      COMPLETE_TIME_0805, // 08:05
      COMPLETE_TIME_0810, // 08:10
      COMPLETE_TIME_0815, // 08:15
      COMPLETE_TIME_0820, // 08:20
      COMPLETE_TIME_0825, // 08:25
      COMPLETE_TIME_0830, // 08:30
      COMPLETE_TIME_0835, // 08:35
      COMPLETE_TIME_0840, // 08:40
      COMPLETE_TIME_0845, // 08:45
      COMPLETE_TIME_0850, // 08:50
      COMPLETE_TIME_0855, // 08:55
      COMPLETE_TIME_0900, // 09:00
      COMPLETE_TIME_0905, // 09:05
      COMPLETE_TIME_0910, // 09:10
      COMPLETE_TIME_0915, // 09:15
      COMPLETE_TIME_0920, // 09:20
      COMPLETE_TIME_0925, // 09:25
      COMPLETE_TIME_0930, // 09:30
      COMPLETE_TIME_0935, // 09:35
      COMPLETE_TIME_0940, // 09:40
      COMPLETE_TIME_0945, // 09:45
      COMPLETE_TIME_0950, // 09:50
      COMPLETE_TIME_0955, // 09:55
      COMPLETE_TIME_1000, // 10:00
      COMPLETE_TIME_1005, // 10:05
      COMPLETE_TIME_1010, // 10:10
      COMPLETE_TIME_1015, // 10:15
      COMPLETE_TIME_1020, // 10:20
      COMPLETE_TIME_1025, // 10:25
      COMPLETE_TIME_1030, // 10:30
      COMPLETE_TIME_1035, // 10:35
      COMPLETE_TIME_1040, // 10:40
      COMPLETE_TIME_1045, // 10:45
      COMPLETE_TIME_1050, // 10:50
      COMPLETE_TIME_1055, // 10:55
      COMPLETE_TIME_1100, // 11:00
      COMPLETE_TIME_1105, // 11:05
      COMPLETE_TIME_1110, // 11:10
      COMPLETE_TIME_1115, // 11:15
      COMPLETE_TIME_1120, // 11:20
      COMPLETE_TIME_1125, // 11:25
      COMPLETE_TIME_1130, // 11:30
      COMPLETE_TIME_1135, // 11:35
      COMPLETE_TIME_1140, // 11:40
      COMPLETE_TIME_1145, // 11:45
      COMPLETE_TIME_1150, // 11:50
      COMPLETE_TIME_1155, // 11:55
      COMPLETE_TIME_1200, // 12:00
      COMPLETE_TIME_1205, // 12:05
      COMPLETE_TIME_1210, // 12:10
      COMPLETE_TIME_1215, // 12:15
      COMPLETE_TIME_1220, // 12:20
      COMPLETE_TIME_1225, // 12:25
      COMPLETE_TIME_1230, // 12:30
      COMPLETE_TIME_1235, // 12:35
      COMPLETE_TIME_1240, // 12:40
      COMPLETE_TIME_1245, // 12:45
      COMPLETE_TIME_1250, // 12:50
      COMPLETE_TIME_1255, // 12:55
      COMPLETE_TIME_1300, // 13:00
      COMPLETE_TIME_1305, // 13:05
      COMPLETE_TIME_1310, // 13:10
      COMPLETE_TIME_1315, // 13:15
      COMPLETE_TIME_1320, // 13:20
      COMPLETE_TIME_1325, // 13:25
      COMPLETE_TIME_1330, // 13:30
      COMPLETE_TIME_1335, // 13:35
      COMPLETE_TIME_1340, // 13:40
      COMPLETE_TIME_1345, // 13:45
      COMPLETE_TIME_1350, // 13:50
      COMPLETE_TIME_1355, // 13:55
      COMPLETE_TIME_1400, // 14:00
      COMPLETE_TIME_1405, // 14:05
      COMPLETE_TIME_1410, // 14:10
      COMPLETE_TIME_1415, // 14:15
      COMPLETE_TIME_1420, // 14:20
      COMPLETE_TIME_1425, // 14:25
      COMPLETE_TIME_1430, // 14:30
      COMPLETE_TIME_1435, // 14:35
      COMPLETE_TIME_1440, // 14:40
      COMPLETE_TIME_1445, // 14:45
      COMPLETE_TIME_1450, // 14:50
      COMPLETE_TIME_1455, // 14:55
      COMPLETE_TIME_1500, // 15:00
      COMPLETE_TIME_1505, // 15:05
      COMPLETE_TIME_1510, // 15:10
      COMPLETE_TIME_1515, // 15:15
      COMPLETE_TIME_1520, // 15:20
      COMPLETE_TIME_1525, // 15:25
      COMPLETE_TIME_1530, // 15:30
      COMPLETE_TIME_1535, // 15:35
      COMPLETE_TIME_1540, // 15:40
      COMPLETE_TIME_1545, // 15:45
      COMPLETE_TIME_1550, // 15:50
      COMPLETE_TIME_1555, // 15:55
      COMPLETE_TIME_1600, // 16:00
      COMPLETE_TIME_1605, // 16:05
      COMPLETE_TIME_1610, // 16:10
      COMPLETE_TIME_1615, // 16:15
      COMPLETE_TIME_1620, // 16:20
      COMPLETE_TIME_1625, // 16:25
      COMPLETE_TIME_1630, // 16:30
      COMPLETE_TIME_1635, // 16:35
      COMPLETE_TIME_1640, // 16:40
      COMPLETE_TIME_1645, // 16:45
      COMPLETE_TIME_1650, // 16:50
      COMPLETE_TIME_1655, // 16:55
      COMPLETE_TIME_1700, // 17:00
      COMPLETE_TIME_1705, // 17:05
      COMPLETE_TIME_1710, // 17:10
      COMPLETE_TIME_1715, // 17:15
      COMPLETE_TIME_1720, // 17:20
      COMPLETE_TIME_1725, // 17:25
      COMPLETE_TIME_1730, // 17:30
      COMPLETE_TIME_1735, // 17:35
      COMPLETE_TIME_1740, // 17:40
      COMPLETE_TIME_1745, // 17:45
      COMPLETE_TIME_1750, // 17:50
      COMPLETE_TIME_1755, // 17:55
      COMPLETE_TIME_1800, // 18:00
      COMPLETE_TIME_1805, // 18:05
      COMPLETE_TIME_1810, // 18:10
      COMPLETE_TIME_1815, // 18:15
      COMPLETE_TIME_1820, // 18:20
      COMPLETE_TIME_1825, // 18:25
      COMPLETE_TIME_1830, // 18:30
      COMPLETE_TIME_1835, // 18:35
      COMPLETE_TIME_1840, // 18:40
      COMPLETE_TIME_1845, // 18:45
      COMPLETE_TIME_1850, // 18:50
      COMPLETE_TIME_1855, // 18:55
      COMPLETE_TIME_1900, // 19:00
      COMPLETE_TIME_1905, // 19:05
      COMPLETE_TIME_1910, // 19:10
      COMPLETE_TIME_1915, // 19:15
      COMPLETE_TIME_1920, // 19:20
      COMPLETE_TIME_1925, // 19:25
      COMPLETE_TIME_1930, // 19:30
      COMPLETE_TIME_1935, // 19:35
      COMPLETE_TIME_1940, // 19:40
      COMPLETE_TIME_1945, // 19:45
      COMPLETE_TIME_1950, // 19:50
      COMPLETE_TIME_1955, // 19:55
      COMPLETE_TIME_2000, // 20:00
      COMPLETE_TIME_2005, // 20:05
      COMPLETE_TIME_2010, // 20:10
      COMPLETE_TIME_2015, // 20:15
      COMPLETE_TIME_2020, // 20:20
      COMPLETE_TIME_2025, // 20:25
      COMPLETE_TIME_2030, // 20:30
      COMPLETE_TIME_2035, // 20:35
      COMPLETE_TIME_2040, // 20:40
      COMPLETE_TIME_2045, // 20:45
      COMPLETE_TIME_2050, // 20:50
      COMPLETE_TIME_2055, // 20:55
      COMPLETE_TIME_2100, // 21:00
      COMPLETE_TIME_2105, // 21:05
      COMPLETE_TIME_2110, // 21:10
      COMPLETE_TIME_2115, // 21:15
      COMPLETE_TIME_2120, // 21:20
      COMPLETE_TIME_2125, // 21:25
      COMPLETE_TIME_2130, // 21:30
      COMPLETE_TIME_2135, // 21:35
      COMPLETE_TIME_2140, // 21:40
      COMPLETE_TIME_2145, // 21:45
      COMPLETE_TIME_2150, // 21:50
      COMPLETE_TIME_2155, // 21:55
      COMPLETE_TIME_2200, // 22:00
      COMPLETE_TIME_2205, // 22:05
      COMPLETE_TIME_2210, // 22:10
      COMPLETE_TIME_2215, // 22:15
      COMPLETE_TIME_2220, // 22:20
      COMPLETE_TIME_2225, // 22:25
      COMPLETE_TIME_2230, // 22:30
      COMPLETE_TIME_2235, // 22:35
      COMPLETE_TIME_2240, // 22:40
      COMPLETE_TIME_2245, // 22:45
      COMPLETE_TIME_2250, // 22:50
      COMPLETE_TIME_2255, // 22:55
      COMPLETE_TIME_2300, // 23:00
      COMPLETE_TIME_2305, // 23:05
      COMPLETE_TIME_2310, // 23:10
      COMPLETE_TIME_2315, // 23:15
      COMPLETE_TIME_2320, // 23:20
      COMPLETE_TIME_2325, // 23:25
      COMPLETE_TIME_2330, // 23:30
      COMPLETE_TIME_2335, // 23:35
      COMPLETE_TIME_2340, // 23:40
      COMPLETE_TIME_2345, // 23:45
      COMPLETE_TIME_2350, // 23:50
      COMPLETE_TIME_2355, // 23:55
   };

datetime EnumTimeToDateTimeComplete(ENUM_HOUR_COMPLETE time)
   {
      switch (time)
      {
         case COMPLETE_TIME_0000: return (StringToTime("00:00"));
         case COMPLETE_TIME_0005: return (StringToTime("00:05"));
         case COMPLETE_TIME_0010: return (StringToTime("00:10"));
         case COMPLETE_TIME_0015: return (StringToTime("00:15"));
         case COMPLETE_TIME_0020: return (StringToTime("00:20"));
         case COMPLETE_TIME_0025: return (StringToTime("00:25"));
         case COMPLETE_TIME_0030: return (StringToTime("00:30"));
         case COMPLETE_TIME_0035: return (StringToTime("00:35"));
         case COMPLETE_TIME_0040: return (StringToTime("00:40"));
         case COMPLETE_TIME_0045: return (StringToTime("00:45"));
         case COMPLETE_TIME_0050: return (StringToTime("00:50"));
         case COMPLETE_TIME_0055: return (StringToTime("00:55"));
         case COMPLETE_TIME_0100: return (StringToTime("01:00"));
         case COMPLETE_TIME_0105: return (StringToTime("01:05"));
         case COMPLETE_TIME_0110: return (StringToTime("01:10"));
         case COMPLETE_TIME_0115: return (StringToTime("01:15"));
         case COMPLETE_TIME_0120: return (StringToTime("01:20"));
         case COMPLETE_TIME_0125: return (StringToTime("01:25"));
         case COMPLETE_TIME_0130: return (StringToTime("01:30"));
         case COMPLETE_TIME_0135: return (StringToTime("01:35"));
         case COMPLETE_TIME_0140: return (StringToTime("01:40"));
         case COMPLETE_TIME_0145: return (StringToTime("01:45"));
         case COMPLETE_TIME_0150: return (StringToTime("01:50"));
         case COMPLETE_TIME_0155: return (StringToTime("01:55"));
         case COMPLETE_TIME_0200: return (StringToTime("02:00"));
         case COMPLETE_TIME_0205: return (StringToTime("02:05"));
         case COMPLETE_TIME_0210: return (StringToTime("02:10"));
         case COMPLETE_TIME_0215: return (StringToTime("02:15"));
         case COMPLETE_TIME_0220: return (StringToTime("02:20"));
         case COMPLETE_TIME_0225: return (StringToTime("02:25"));
         case COMPLETE_TIME_0230: return (StringToTime("02:30"));
         case COMPLETE_TIME_0235: return (StringToTime("02:35"));
         case COMPLETE_TIME_0240: return (StringToTime("02:40"));
         case COMPLETE_TIME_0245: return (StringToTime("02:45"));
         case COMPLETE_TIME_0250: return (StringToTime("02:50"));
         case COMPLETE_TIME_0255: return (StringToTime("02:55"));
         case COMPLETE_TIME_0300: return (StringToTime("03:00"));
         case COMPLETE_TIME_0305: return (StringToTime("03:05"));
         case COMPLETE_TIME_0310: return (StringToTime("03:10"));
         case COMPLETE_TIME_0315: return (StringToTime("03:15"));
         case COMPLETE_TIME_0320: return (StringToTime("03:20"));
         case COMPLETE_TIME_0325: return (StringToTime("03:25"));
         case COMPLETE_TIME_0330: return (StringToTime("03:30"));
         case COMPLETE_TIME_0335: return (StringToTime("03:35"));
         case COMPLETE_TIME_0340: return (StringToTime("03:40"));
         case COMPLETE_TIME_0345: return (StringToTime("03:45"));
         case COMPLETE_TIME_0350: return (StringToTime("03:50"));
         case COMPLETE_TIME_0355: return (StringToTime("03:55"));
         case COMPLETE_TIME_0400: return (StringToTime("04:00"));
         case COMPLETE_TIME_0405: return (StringToTime("04:05"));
         case COMPLETE_TIME_0410: return (StringToTime("04:10"));
         case COMPLETE_TIME_0415: return (StringToTime("04:15"));
         case COMPLETE_TIME_0420: return (StringToTime("04:20"));
         case COMPLETE_TIME_0425: return (StringToTime("04:25"));
         case COMPLETE_TIME_0430: return (StringToTime("04:30"));
         case COMPLETE_TIME_0435: return (StringToTime("04:35"));
         case COMPLETE_TIME_0440: return (StringToTime("04:40"));
         case COMPLETE_TIME_0445: return (StringToTime("04:45"));
         case COMPLETE_TIME_0450: return (StringToTime("04:50"));
         case COMPLETE_TIME_0455: return (StringToTime("04:55"));
         case COMPLETE_TIME_0500: return (StringToTime("05:00"));
         case COMPLETE_TIME_0505: return (StringToTime("05:05"));
         case COMPLETE_TIME_0510: return (StringToTime("05:10"));
         case COMPLETE_TIME_0515: return (StringToTime("05:15"));
         case COMPLETE_TIME_0520: return (StringToTime("05:20"));
         case COMPLETE_TIME_0525: return (StringToTime("05:25"));
         case COMPLETE_TIME_0530: return (StringToTime("05:30"));
         case COMPLETE_TIME_0535: return (StringToTime("05:35"));
         case COMPLETE_TIME_0540: return (StringToTime("05:40"));
         case COMPLETE_TIME_0545: return (StringToTime("05:45"));
         case COMPLETE_TIME_0550: return (StringToTime("05:50"));
         case COMPLETE_TIME_0555: return (StringToTime("05:55"));
         case COMPLETE_TIME_0600: return (StringToTime("06:00"));
         case COMPLETE_TIME_0605: return (StringToTime("06:05"));
         case COMPLETE_TIME_0610: return (StringToTime("06:10"));
         case COMPLETE_TIME_0615: return (StringToTime("06:15"));
         case COMPLETE_TIME_0620: return (StringToTime("06:20"));
         case COMPLETE_TIME_0625: return (StringToTime("06:25"));
         case COMPLETE_TIME_0630: return (StringToTime("06:30"));
         case COMPLETE_TIME_0635: return (StringToTime("06:35"));
         case COMPLETE_TIME_0640: return (StringToTime("06:40"));
         case COMPLETE_TIME_0645: return (StringToTime("06:45"));
         case COMPLETE_TIME_0650: return (StringToTime("06:50"));
         case COMPLETE_TIME_0655: return (StringToTime("06:55"));
         case COMPLETE_TIME_0700: return (StringToTime("07:00"));
         case COMPLETE_TIME_0705: return (StringToTime("07:05"));
         case COMPLETE_TIME_0710: return (StringToTime("07:10"));
         case COMPLETE_TIME_0715: return (StringToTime("07:15"));
         case COMPLETE_TIME_0720: return (StringToTime("07:20"));
         case COMPLETE_TIME_0725: return (StringToTime("07:25"));
         case COMPLETE_TIME_0730: return (StringToTime("07:30"));
         case COMPLETE_TIME_0735: return (StringToTime("07:35"));
         case COMPLETE_TIME_0740: return (StringToTime("07:40"));
         case COMPLETE_TIME_0745: return (StringToTime("07:45"));
         case COMPLETE_TIME_0750: return (StringToTime("07:50"));
         case COMPLETE_TIME_0755: return (StringToTime("07:55"));
         case COMPLETE_TIME_0800: return (StringToTime("08:00"));
         case COMPLETE_TIME_0805: return (StringToTime("08:05"));
         case COMPLETE_TIME_0810: return (StringToTime("08:10"));
         case COMPLETE_TIME_0815: return (StringToTime("08:15"));
         case COMPLETE_TIME_0820: return (StringToTime("08:20"));
         case COMPLETE_TIME_0825: return (StringToTime("08:25"));
         case COMPLETE_TIME_0830: return (StringToTime("08:30"));
         case COMPLETE_TIME_0835: return (StringToTime("08:35"));
         case COMPLETE_TIME_0840: return (StringToTime("08:40"));
         case COMPLETE_TIME_0845: return (StringToTime("08:45"));
         case COMPLETE_TIME_0850: return (StringToTime("08:50"));
         case COMPLETE_TIME_0855: return (StringToTime("08:55"));
         case COMPLETE_TIME_0900: return (StringToTime("09:00"));
         case COMPLETE_TIME_0905: return (StringToTime("09:05"));
         case COMPLETE_TIME_0910: return (StringToTime("09:10"));
         case COMPLETE_TIME_0915: return (StringToTime("09:15"));
         case COMPLETE_TIME_0920: return (StringToTime("09:20"));
         case COMPLETE_TIME_0925: return (StringToTime("09:25"));
         case COMPLETE_TIME_0930: return (StringToTime("09:30"));
         case COMPLETE_TIME_0935: return (StringToTime("09:35"));
         case COMPLETE_TIME_0940: return (StringToTime("09:40"));
         case COMPLETE_TIME_0945: return (StringToTime("09:45"));
         case COMPLETE_TIME_0950: return (StringToTime("09:50"));
         case COMPLETE_TIME_0955: return (StringToTime("09:55"));
         case COMPLETE_TIME_1000: return (StringToTime("10:00"));
         case COMPLETE_TIME_1005: return (StringToTime("10:05"));
         case COMPLETE_TIME_1010: return (StringToTime("10:10"));
         case COMPLETE_TIME_1015: return (StringToTime("10:15"));
         case COMPLETE_TIME_1020: return (StringToTime("10:20"));
         case COMPLETE_TIME_1025: return (StringToTime("10:25"));
         case COMPLETE_TIME_1030: return (StringToTime("10:30"));
         case COMPLETE_TIME_1035: return (StringToTime("10:35"));
         case COMPLETE_TIME_1040: return (StringToTime("10:40"));
         case COMPLETE_TIME_1045: return (StringToTime("10:45"));
         case COMPLETE_TIME_1050: return (StringToTime("10:50"));
         case COMPLETE_TIME_1055: return (StringToTime("10:55"));
         case COMPLETE_TIME_1100: return (StringToTime("11:00"));
         case COMPLETE_TIME_1105: return (StringToTime("11:05"));
         case COMPLETE_TIME_1110: return (StringToTime("11:10"));
         case COMPLETE_TIME_1115: return (StringToTime("11:15"));
         case COMPLETE_TIME_1120: return (StringToTime("11:20"));
         case COMPLETE_TIME_1125: return (StringToTime("11:25"));
         case COMPLETE_TIME_1130: return (StringToTime("11:30"));
         case COMPLETE_TIME_1135: return (StringToTime("11:35"));
         case COMPLETE_TIME_1140: return (StringToTime("11:40"));
         case COMPLETE_TIME_1145: return (StringToTime("11:45"));
         case COMPLETE_TIME_1150: return (StringToTime("11:50"));
         case COMPLETE_TIME_1155: return (StringToTime("11:55"));
         case COMPLETE_TIME_1200: return (StringToTime("12:00"));
         case COMPLETE_TIME_1205: return (StringToTime("12:05"));
         case COMPLETE_TIME_1210: return (StringToTime("12:10"));
         case COMPLETE_TIME_1215: return (StringToTime("12:15"));
         case COMPLETE_TIME_1220: return (StringToTime("12:20"));
         case COMPLETE_TIME_1225: return (StringToTime("12:25"));
         case COMPLETE_TIME_1230: return (StringToTime("12:30"));
         case COMPLETE_TIME_1235: return (StringToTime("12:35"));
         case COMPLETE_TIME_1240: return (StringToTime("12:40"));
         case COMPLETE_TIME_1245: return (StringToTime("12:45"));
         case COMPLETE_TIME_1250: return (StringToTime("12:50"));
         case COMPLETE_TIME_1255: return (StringToTime("12:55"));
         case COMPLETE_TIME_1300: return (StringToTime("13:00"));
         case COMPLETE_TIME_1305: return (StringToTime("13:05"));
         case COMPLETE_TIME_1310: return (StringToTime("13:10"));
         case COMPLETE_TIME_1315: return (StringToTime("13:15"));
         case COMPLETE_TIME_1320: return (StringToTime("13:20"));
         case COMPLETE_TIME_1325: return (StringToTime("13:25"));
         case COMPLETE_TIME_1330: return (StringToTime("13:30"));
         case COMPLETE_TIME_1335: return (StringToTime("13:35"));
         case COMPLETE_TIME_1340: return (StringToTime("13:40"));
         case COMPLETE_TIME_1345: return (StringToTime("13:45"));
         case COMPLETE_TIME_1350: return (StringToTime("13:50"));
         case COMPLETE_TIME_1355: return (StringToTime("13:55"));
         case COMPLETE_TIME_1400: return (StringToTime("14:00"));
         case COMPLETE_TIME_1405: return (StringToTime("14:05"));
         case COMPLETE_TIME_1410: return (StringToTime("14:10"));
         case COMPLETE_TIME_1415: return (StringToTime("14:15"));
         case COMPLETE_TIME_1420: return (StringToTime("14:20"));
         case COMPLETE_TIME_1425: return (StringToTime("14:25"));
         case COMPLETE_TIME_1430: return (StringToTime("14:30"));
         case COMPLETE_TIME_1435: return (StringToTime("14:35"));
         case COMPLETE_TIME_1440: return (StringToTime("14:40"));
         case COMPLETE_TIME_1445: return (StringToTime("14:45"));
         case COMPLETE_TIME_1450: return (StringToTime("14:50"));
         case COMPLETE_TIME_1455: return (StringToTime("14:55"));
         case COMPLETE_TIME_1500: return (StringToTime("15:00"));
         case COMPLETE_TIME_1505: return (StringToTime("15:05"));
         case COMPLETE_TIME_1510: return (StringToTime("15:10"));
         case COMPLETE_TIME_1515: return (StringToTime("15:15"));
         case COMPLETE_TIME_1520: return (StringToTime("15:20"));
         case COMPLETE_TIME_1525: return (StringToTime("15:25"));
         case COMPLETE_TIME_1530: return (StringToTime("15:30"));
         case COMPLETE_TIME_1535: return (StringToTime("15:35"));
         case COMPLETE_TIME_1540: return (StringToTime("15:40"));
         case COMPLETE_TIME_1545: return (StringToTime("15:45"));
         case COMPLETE_TIME_1550: return (StringToTime("15:50"));
         case COMPLETE_TIME_1555: return (StringToTime("15:55"));
         case COMPLETE_TIME_1600: return (StringToTime("16:00"));
         case COMPLETE_TIME_1605: return (StringToTime("16:05"));
         case COMPLETE_TIME_1610: return (StringToTime("16:10"));
         case COMPLETE_TIME_1615: return (StringToTime("16:15"));
         case COMPLETE_TIME_1620: return (StringToTime("16:20"));
         case COMPLETE_TIME_1625: return (StringToTime("16:25"));
         case COMPLETE_TIME_1630: return (StringToTime("16:30"));
         case COMPLETE_TIME_1635: return (StringToTime("16:35"));
         case COMPLETE_TIME_1640: return (StringToTime("16:40"));
         case COMPLETE_TIME_1645: return (StringToTime("16:45"));
         case COMPLETE_TIME_1650: return (StringToTime("16:50"));
         case COMPLETE_TIME_1655: return (StringToTime("16:55"));
         case COMPLETE_TIME_1700: return (StringToTime("17:00"));
         case COMPLETE_TIME_1705: return (StringToTime("17:05"));
         case COMPLETE_TIME_1710: return (StringToTime("17:10"));
         case COMPLETE_TIME_1715: return (StringToTime("17:15"));
         case COMPLETE_TIME_1720: return (StringToTime("17:20"));
         case COMPLETE_TIME_1725: return (StringToTime("17:25"));
         case COMPLETE_TIME_1730: return (StringToTime("17:30"));
         case COMPLETE_TIME_1735: return (StringToTime("17:35"));
         case COMPLETE_TIME_1740: return (StringToTime("17:40"));
         case COMPLETE_TIME_1745: return (StringToTime("17:45"));
         case COMPLETE_TIME_1750: return (StringToTime("17:50"));
         case COMPLETE_TIME_1755: return (StringToTime("17:55"));
         case COMPLETE_TIME_1800: return (StringToTime("18:00"));
         case COMPLETE_TIME_1805: return (StringToTime("18:05"));
         case COMPLETE_TIME_1810: return (StringToTime("18:10"));
         case COMPLETE_TIME_1815: return (StringToTime("18:15"));
         case COMPLETE_TIME_1820: return (StringToTime("18:20"));
         case COMPLETE_TIME_1825: return (StringToTime("18:25"));
         case COMPLETE_TIME_1830: return (StringToTime("18:30"));
         case COMPLETE_TIME_1835: return (StringToTime("18:35"));
         case COMPLETE_TIME_1840: return (StringToTime("18:40"));
         case COMPLETE_TIME_1845: return (StringToTime("18:45"));
         case COMPLETE_TIME_1850: return (StringToTime("18:50"));
         case COMPLETE_TIME_1855: return (StringToTime("18:55"));
         case COMPLETE_TIME_1900: return (StringToTime("19:00"));
         case COMPLETE_TIME_1905: return (StringToTime("19:05"));
         case COMPLETE_TIME_1910: return (StringToTime("19:10"));
         case COMPLETE_TIME_1915: return (StringToTime("19:15"));
         case COMPLETE_TIME_1920: return (StringToTime("19:20"));
         case COMPLETE_TIME_1925: return (StringToTime("19:25"));
         case COMPLETE_TIME_1930: return (StringToTime("19:30"));
         case COMPLETE_TIME_1935: return (StringToTime("19:35"));
         case COMPLETE_TIME_1940: return (StringToTime("19:40"));
         case COMPLETE_TIME_1945: return (StringToTime("19:45"));
         case COMPLETE_TIME_1950: return (StringToTime("19:50"));
         case COMPLETE_TIME_1955: return (StringToTime("19:55"));
         case COMPLETE_TIME_2000: return (StringToTime("20:00"));
         case COMPLETE_TIME_2005: return (StringToTime("20:05"));
         case COMPLETE_TIME_2010: return (StringToTime("20:10"));
         case COMPLETE_TIME_2015: return (StringToTime("20:15"));
         case COMPLETE_TIME_2020: return (StringToTime("20:20"));
         case COMPLETE_TIME_2025: return (StringToTime("20:25"));
         case COMPLETE_TIME_2030: return (StringToTime("20:30"));
         case COMPLETE_TIME_2035: return (StringToTime("20:35"));
         case COMPLETE_TIME_2040: return (StringToTime("20:40"));
         case COMPLETE_TIME_2045: return (StringToTime("20:45"));
         case COMPLETE_TIME_2050: return (StringToTime("20:50"));
         case COMPLETE_TIME_2055: return (StringToTime("20:55"));
         case COMPLETE_TIME_2100: return (StringToTime("21:00"));
         case COMPLETE_TIME_2105: return (StringToTime("21:05"));
         case COMPLETE_TIME_2110: return (StringToTime("21:10"));
         case COMPLETE_TIME_2115: return (StringToTime("21:15"));
         case COMPLETE_TIME_2120: return (StringToTime("21:20"));
         case COMPLETE_TIME_2125: return (StringToTime("21:25"));
         case COMPLETE_TIME_2130: return (StringToTime("21:30"));
         case COMPLETE_TIME_2135: return (StringToTime("21:35"));
         case COMPLETE_TIME_2140: return (StringToTime("21:40"));
         case COMPLETE_TIME_2145: return (StringToTime("21:45"));
         case COMPLETE_TIME_2150: return (StringToTime("21:50"));
         case COMPLETE_TIME_2155: return (StringToTime("21:55"));
         case COMPLETE_TIME_2200: return (StringToTime("22:00"));
         case COMPLETE_TIME_2205: return (StringToTime("22:05"));
         case COMPLETE_TIME_2210: return (StringToTime("22:10"));
         case COMPLETE_TIME_2215: return (StringToTime("22:15"));
         case COMPLETE_TIME_2220: return (StringToTime("22:20"));
         case COMPLETE_TIME_2225: return (StringToTime("22:25"));
         case COMPLETE_TIME_2230: return (StringToTime("22:30"));
         case COMPLETE_TIME_2235: return (StringToTime("22:35"));
         case COMPLETE_TIME_2240: return (StringToTime("22:40"));
         case COMPLETE_TIME_2245: return (StringToTime("22:45"));
         case COMPLETE_TIME_2250: return (StringToTime("22:50"));
         case COMPLETE_TIME_2255: return (StringToTime("22:55"));
         case COMPLETE_TIME_2300: return (StringToTime("23:00"));
         case COMPLETE_TIME_2305: return (StringToTime("23:05"));
         case COMPLETE_TIME_2310: return (StringToTime("23:10"));
         case COMPLETE_TIME_2315: return (StringToTime("23:15"));
         case COMPLETE_TIME_2320: return (StringToTime("23:20"));
         case COMPLETE_TIME_2325: return (StringToTime("23:25"));
         case COMPLETE_TIME_2330: return (StringToTime("23:30"));
         case COMPLETE_TIME_2335: return (StringToTime("23:35"));
         case COMPLETE_TIME_2340: return (StringToTime("23:40"));
         case COMPLETE_TIME_2345: return (StringToTime("23:45"));
         case COMPLETE_TIME_2350: return (StringToTime("23:50"));
         case COMPLETE_TIME_2355: return (StringToTime("23:55"));        
      }
      return GetLastError();
   };

enum ENUM_HOUR_PARTIAL
   {
      PARTIAL_TIME_NULL, // Disable
      PARTIAL_TIME_0000, // 00:00
      PARTIAL_TIME_0015, // 00:15
      PARTIAL_TIME_0030, // 00:30
      PARTIAL_TIME_0045, // 00:45
      PARTIAL_TIME_0100, // 01:00
      PARTIAL_TIME_0115, // 01:15
      PARTIAL_TIME_0130, // 01:30
      PARTIAL_TIME_0145, // 01:45
      PARTIAL_TIME_0200, // 02:00
      PARTIAL_TIME_0215, // 02:15
      PARTIAL_TIME_0230, // 02:30
      PARTIAL_TIME_0245, // 02:45
      PARTIAL_TIME_0300, // 03:00
      PARTIAL_TIME_0315, // 03:15
      PARTIAL_TIME_0330, // 03:30
      PARTIAL_TIME_0345, // 03:45
      PARTIAL_TIME_0400, // 04:00
      PARTIAL_TIME_0415, // 04:15
      PARTIAL_TIME_0430, // 04:30
      PARTIAL_TIME_0445, // 04:45
      PARTIAL_TIME_0500, // 05:00
      PARTIAL_TIME_0515, // 05:15
      PARTIAL_TIME_0530, // 05:30
      PARTIAL_TIME_0545, // 05:45
      PARTIAL_TIME_0600, // 06:00
      PARTIAL_TIME_0615, // 06:15
      PARTIAL_TIME_0630, // 06:30
      PARTIAL_TIME_0645, // 06:45
      PARTIAL_TIME_0700, // 07:00
      PARTIAL_TIME_0715, // 07:15
      PARTIAL_TIME_0730, // 07:30
      PARTIAL_TIME_0745, // 07:45
      PARTIAL_TIME_0800, // 08:00
      PARTIAL_TIME_0815, // 08:15
      PARTIAL_TIME_0830, // 08:30
      PARTIAL_TIME_0845, // 08:45
      PARTIAL_TIME_0900, // 09:00
      PARTIAL_TIME_0915, // 09:15
      PARTIAL_TIME_0930, // 09:30
      PARTIAL_TIME_0945, // 09:45
      PARTIAL_TIME_1000, // 10:00
      PARTIAL_TIME_1015, // 10:15
      PARTIAL_TIME_1030, // 10:30
      PARTIAL_TIME_1045, // 10:45
      PARTIAL_TIME_1100, // 11:00
      PARTIAL_TIME_1115, // 11:15
      PARTIAL_TIME_1130, // 11:30
      PARTIAL_TIME_1145, // 11:45
      PARTIAL_TIME_1200, // 12:00
      PARTIAL_TIME_1215, // 12:15
      PARTIAL_TIME_1230, // 12:30
      PARTIAL_TIME_1245, // 12:45
      PARTIAL_TIME_1300, // 13:00
      PARTIAL_TIME_1315, // 13:15
      PARTIAL_TIME_1330, // 13:30
      PARTIAL_TIME_1345, // 13:45
      PARTIAL_TIME_1400, // 14:00
      PARTIAL_TIME_1415, // 14:15
      PARTIAL_TIME_1430, // 14:30
      PARTIAL_TIME_1445, // 14:45
      PARTIAL_TIME_1500, // 15:00
      PARTIAL_TIME_1515, // 15:15
      PARTIAL_TIME_1530, // 15:30
      PARTIAL_TIME_1545, // 15:45
      PARTIAL_TIME_1600, // 16:00
      PARTIAL_TIME_1615, // 16:15
      PARTIAL_TIME_1630, // 16:30
      PARTIAL_TIME_1645, // 16:45
      PARTIAL_TIME_1700, // 17:00
      PARTIAL_TIME_1715, // 17:15
      PARTIAL_TIME_1730, // 17:30
      PARTIAL_TIME_1745, // 17:45
      PARTIAL_TIME_1800, // 18:00
      PARTIAL_TIME_1815, // 18:15
      PARTIAL_TIME_1830, // 18:30
      PARTIAL_TIME_1845, // 18:45
      PARTIAL_TIME_1900, // 19:00
      PARTIAL_TIME_1915, // 19:15
      PARTIAL_TIME_1930, // 19:30
      PARTIAL_TIME_1945, // 19:45
      PARTIAL_TIME_2000, // 20:00
      PARTIAL_TIME_2015, // 20:15
      PARTIAL_TIME_2030, // 20:30
      PARTIAL_TIME_2045, // 20:45
      PARTIAL_TIME_2100, // 21:00
      PARTIAL_TIME_2115, // 21:15
      PARTIAL_TIME_2130, // 21:30
      PARTIAL_TIME_2145, // 21:45
      PARTIAL_TIME_2200, // 22:00
      PARTIAL_TIME_2215, // 22:15
      PARTIAL_TIME_2230, // 22:30
      PARTIAL_TIME_2245, // 22:45
      PARTIAL_TIME_2300, // 23:00
      PARTIAL_TIME_2315, // 23:15
      PARTIAL_TIME_2330, // 23:30
      PARTIAL_TIME_2345  // 23:45
   };

datetime EnumTimeToDateTimePartial(ENUM_HOUR_PARTIAL time)
   {
      switch (time)
      {
         case PARTIAL_TIME_0000: return (StringToTime("00:00"));
         case PARTIAL_TIME_0015: return (StringToTime("00:15"));
         case PARTIAL_TIME_0030: return (StringToTime("00:30"));
         case PARTIAL_TIME_0045: return (StringToTime("00:45"));
         case PARTIAL_TIME_0100: return (StringToTime("01:00"));
         case PARTIAL_TIME_0115: return (StringToTime("01:15"));
         case PARTIAL_TIME_0130: return (StringToTime("01:30"));
         case PARTIAL_TIME_0145: return (StringToTime("01:45"));
         case PARTIAL_TIME_0200: return (StringToTime("02:00"));
         case PARTIAL_TIME_0215: return (StringToTime("02:15"));
         case PARTIAL_TIME_0230: return (StringToTime("02:30"));
         case PARTIAL_TIME_0245: return (StringToTime("02:45"));
         case PARTIAL_TIME_0300: return (StringToTime("03:00"));
         case PARTIAL_TIME_0315: return (StringToTime("03:15"));
         case PARTIAL_TIME_0330: return (StringToTime("03:30"));
         case PARTIAL_TIME_0345: return (StringToTime("03:45"));
         case PARTIAL_TIME_0400: return (StringToTime("04:00"));
         case PARTIAL_TIME_0415: return (StringToTime("04:15"));
         case PARTIAL_TIME_0430: return (StringToTime("04:30"));
         case PARTIAL_TIME_0445: return (StringToTime("04:45"));
         case PARTIAL_TIME_0500: return (StringToTime("05:00"));
         case PARTIAL_TIME_0515: return (StringToTime("05:15"));
         case PARTIAL_TIME_0530: return (StringToTime("05:30"));
         case PARTIAL_TIME_0545: return (StringToTime("05:45"));
         case PARTIAL_TIME_0600: return (StringToTime("06:00"));
         case PARTIAL_TIME_0615: return (StringToTime("06:15"));
         case PARTIAL_TIME_0630: return (StringToTime("06:30"));
         case PARTIAL_TIME_0645: return (StringToTime("06:45"));
         case PARTIAL_TIME_0700: return (StringToTime("07:00"));
         case PARTIAL_TIME_0715: return (StringToTime("07:15"));
         case PARTIAL_TIME_0730: return (StringToTime("07:30"));
         case PARTIAL_TIME_0745: return (StringToTime("07:45"));
         case PARTIAL_TIME_0800: return (StringToTime("08:00"));
         case PARTIAL_TIME_0815: return (StringToTime("08:15"));
         case PARTIAL_TIME_0830: return (StringToTime("08:30"));
         case PARTIAL_TIME_0845: return (StringToTime("08:45"));
         case PARTIAL_TIME_0900: return (StringToTime("09:00"));
         case PARTIAL_TIME_0915: return (StringToTime("09:15"));
         case PARTIAL_TIME_0930: return (StringToTime("09:30"));
         case PARTIAL_TIME_0945: return (StringToTime("09:45"));
         case PARTIAL_TIME_1000: return (StringToTime("10:00"));
         case PARTIAL_TIME_1015: return (StringToTime("10:15"));
         case PARTIAL_TIME_1030: return (StringToTime("10:30"));
         case PARTIAL_TIME_1045: return (StringToTime("10:45"));
         case PARTIAL_TIME_1100: return (StringToTime("11:00"));
         case PARTIAL_TIME_1115: return (StringToTime("11:15"));
         case PARTIAL_TIME_1130: return (StringToTime("11:30"));
         case PARTIAL_TIME_1145: return (StringToTime("11:45"));
         case PARTIAL_TIME_1200: return (StringToTime("12:00"));
         case PARTIAL_TIME_1215: return (StringToTime("12:15"));
         case PARTIAL_TIME_1230: return (StringToTime("12:30"));
         case PARTIAL_TIME_1245: return (StringToTime("12:45"));
         case PARTIAL_TIME_1300: return (StringToTime("13:00"));
         case PARTIAL_TIME_1315: return (StringToTime("13:15"));
         case PARTIAL_TIME_1330: return (StringToTime("13:30"));
         case PARTIAL_TIME_1345: return (StringToTime("13:45"));
         case PARTIAL_TIME_1400: return (StringToTime("14:00"));
         case PARTIAL_TIME_1415: return (StringToTime("14:15"));
         case PARTIAL_TIME_1430: return (StringToTime("14:30"));
         case PARTIAL_TIME_1445: return (StringToTime("14:45"));
         case PARTIAL_TIME_1500: return (StringToTime("15:00"));
         case PARTIAL_TIME_1515: return (StringToTime("15:15"));
         case PARTIAL_TIME_1530: return (StringToTime("15:30"));
         case PARTIAL_TIME_1545: return (StringToTime("15:45"));
         case PARTIAL_TIME_1600: return (StringToTime("16:00"));
         case PARTIAL_TIME_1615: return (StringToTime("16:15"));
         case PARTIAL_TIME_1630: return (StringToTime("16:30"));
         case PARTIAL_TIME_1645: return (StringToTime("16:45"));
         case PARTIAL_TIME_1700: return (StringToTime("17:00"));
         case PARTIAL_TIME_1715: return (StringToTime("17:15"));
         case PARTIAL_TIME_1730: return (StringToTime("17:30"));
         case PARTIAL_TIME_1745: return (StringToTime("17:45"));
         case PARTIAL_TIME_1800: return (StringToTime("18:00"));
         case PARTIAL_TIME_1815: return (StringToTime("18:15"));
         case PARTIAL_TIME_1830: return (StringToTime("18:30"));
         case PARTIAL_TIME_1845: return (StringToTime("18:45"));
         case PARTIAL_TIME_1900: return (StringToTime("19:00"));
         case PARTIAL_TIME_1915: return (StringToTime("19:15"));
         case PARTIAL_TIME_1930: return (StringToTime("19:30"));
         case PARTIAL_TIME_1945: return (StringToTime("19:45"));
         case PARTIAL_TIME_2000: return (StringToTime("20:00"));
         case PARTIAL_TIME_2015: return (StringToTime("20:15"));
         case PARTIAL_TIME_2030: return (StringToTime("20:30"));
         case PARTIAL_TIME_2045: return (StringToTime("20:45"));
         case PARTIAL_TIME_2100: return (StringToTime("21:00"));
         case PARTIAL_TIME_2115: return (StringToTime("21:15"));
         case PARTIAL_TIME_2130: return (StringToTime("21:30"));
         case PARTIAL_TIME_2145: return (StringToTime("21:45"));
         case PARTIAL_TIME_2200: return (StringToTime("22:00"));
         case PARTIAL_TIME_2215: return (StringToTime("22:15"));
         case PARTIAL_TIME_2230: return (StringToTime("22:30"));
         case PARTIAL_TIME_2245: return (StringToTime("22:45"));
         case PARTIAL_TIME_2300: return (StringToTime("23:00"));
         case PARTIAL_TIME_2315: return (StringToTime("23:15"));
         case PARTIAL_TIME_2330: return (StringToTime("23:30"));
         case PARTIAL_TIME_2345: return (StringToTime("23:45"));
      }
      return GetLastError();
   };       