#include <SFE_BMP180.h>
#include <Wire.h>
#include <math.h>

// You will need to create an SFE_BMP180 object, here called "pressure":

SFE_BMP180 pressure;

#define ALTITUDE 1655.0 // Altitude of SparkFun's HQ in Boulder, CO. in meters
#define SUR_TEMP_PIN 36 // Analog input pin connect to temperature sensor SUR pin
#define OBJ_TEMP_PIN 37 // Analog input pin connect to temperature sensor OBJ pin
float temp_calibration = 0;     //this parameter was used to calibrate the temperature
//float objt_calibration=0.000; //this parameter was used to calibrate the object temperature
float temperature_range = 10;  //we make a map of temperature-voltage according to sensor datasheet. 10 is the temperature step when sensor and
//object distance is 9CM.
float offset_vol = 0;      //this parameter was used to set the mid level voltage,when put the sensor in normal environment after 10 min,
//the sensor output 0.For example,the surrounding temperature is 29℃，but the result is 27℃ via the sensor,
//you should set the reerence to 0.520 or more,according to your sensor to change.
//the unit is V
float tempValue = 0;
float objtValue = 0;
float current_temp = 0;
float temp = 0;
float temp1 = 0;
float temp2 = 0;
unsigned int temp3 = 0;
const float reference_vol = 0.500;
unsigned char clear_num = 0; //when use lcd to display
float R = 0;
float voltage = 0;


long res[100] = { //Tabel of R-T characteristics from datasheet
  318300, 302903, 288329, 274533, 261471, 249100, 237381, 226276, 215750, 205768,
  196300, 187316, 178788, 170691, 163002, 155700, 148766, 142183, 135936, 130012,
  124400, 119038, 113928, 109059, 104420, 100000, 95788, 91775, 87950, 84305,
  80830, 77517, 74357, 71342, 68466, 65720, 63098, 60595, 58202, 55916,
  53730, 51645, 49652, 47746, 45924, 44180, 42511, 40912, 39380, 37910,
  36500, 35155, 33866, 32631, 31446, 30311, 29222, 28177, 27175, 26213,
  25290, 24403, 23554, 22738, 21955, 21202, 20479, 19783, 19115, 18472,
  17260, 16688, 16138, 15608, 15098, 14608, 14135, 13680, 13242, 12819,
  12412, 12020, 11642, 11278, 10926, 10587, 10260, 9945, 9641, 9347,
  9063, 8789, 8525, 8270, 8023, 7785, 7555, 7333, 7118, 6911
};

float obj [13][12] = { //Tabel of typical output voltages from datasheet
  /*0*/             { 0, -0.274, -0.58, -0.922, -1.301, -1.721, -2.183, -2.691, -3.247, -3.854, -4.516, -5.236}, //
  /*1*/             { 0.271, 0, -0.303, -0.642, -1.018, -1.434, -1.894, -2.398, -2.951, -3.556, -4.215, -4.931}, //→surrounding temperature,from -10,0,10,...100
  /*2*/             { 0.567, 0.3, 0, -0.335, -0.708, -1.121, -1.577, -2.078, -2.628, -3.229, -3.884, -4.597}, //↓object temperature,from -10,0,10,...110
  /*3*/             { 0.891, 0.628, 0.331, 0, -0.369, -0.778, -1.23, -1.728, -2.274, -2.871, -3.523, -4.232},
  /*4*/             { 1.244, 0.985, 0.692, 0.365, 0, -0.405, -0.853, -1.347, -1.889, -2.482, -3.13, -3.835},
  /*5*/             { 1.628, 1.372, 1.084, 0.761, 0.401, 0, -0.444, -0.933, -1.47, -2.059, -2.702, -3.403},
  /*6*/             { 2.043, 1.792, 1.509, 1.191, 0.835, 0.439, 0, -0.484, -1.017, -1.601, -2.24, -2.936},
  /*7*/             { 2.491, 2.246, 1.968, 1.655, 1.304, 0.913, 0.479, 0, -0.528, -1.107, -1.74, -2.431},
  /*8*/             { 2.975, 2.735, 2.462, 2.155, 1.809, 1.424, 0.996, 0.522, 0, -0.573, -1.201, -1.887},
  /*9*/             { 3.495, 3.261, 2.994, 2.692, 2.353, 1.974, 1.552, 1.084, 0.568, 0, -0.622, -1.301},
  /*10*/            { 4.053, 3.825, 3.565, 3.27, 2.937, 2.564, 2.148, 1.687, 1.177, 0.616, 0, -0.673},
  /*11*/            { 4.651, 4.43, 4.177, 3.888, 3.562, 3.196, 2.787, 2.332, 1.829, 1.275, 0.666, 0},
  /*12*/            { 5.29, 5.076, 4.83, 4.549, 4.231, 3.872, 3.47, 3.023, 2.527, 1.98, 1.379, 0.72}
};
void setup()
{
  Serial.begin(9600); // initialize serial communications at 9600 bps
  Serial.println("REBOOT");

  // Initialize the sensor (it is important to get calibration values stored on the device).

  if (pressure.begin())
    Serial.println("BMP180 init success");
  else
  {
    // Oops, something went wrong, this is usually a connection problem,
    // see the comments at the top of this sketch for the proper connections.

    Serial.println("BMP180 init fail\n\n");
    while(1); // Pause forever.
  }
}
void loop()
{
  char status;
  double T,P,p0,a;

  // Loop here getting pressure readings every 10 seconds.

  // If you want sea-level-compensated pressure, as used in weather reports,
  // you will need to know the altitude at which your measurements are taken.
  // We're using a constant called ALTITUDE in this sketch:
  
  //Serial.println();
  //Serial.print("provided altitude: ");
  //Serial.print(ALTITUDE,0);
  //Serial.print(" meters, ");
  //Serial.print(ALTITUDE*3.28084,0);
  //Serial.println(" feet");
  
  // If you want to measure altitude, and not pressure, you will instead need
  // to provide a known baseline pressure. This is shown at the end of the sketch.

  // You must first get a temperature measurement to perform a pressure reading.
  
  // Start a temperature measurement:
  // If request is successful, the number of ms to wait is returned.
  // If request is unsuccessful, 0 is returned.

  status = pressure.startTemperature();
  if (status != 0)
  {
    // Wait for the measurement to complete:
    delay(status);

    // Retrieve the completed temperature measurement:
    // Note that the measurement is stored in the variable T.
    // Function returns 1 if successful, 0 if failure.

    status = pressure.getTemperature(T);
    if (status != 0)
    {
      // Print out the measurement:
      //Serial.print("temperature: ");
      //Serial.print(T,2);
      //Serial.print(" deg C, ");
      //Serial.print((9.0/5.0)*T+32.0,2);
      //Serial.println(" deg F");
      
      // Start a pressure measurement:
      // The parameter is the oversampling setting, from 0 to 3 (highest res, longest wait).
      // If request is successful, the number of ms to wait is returned.
      // If request is unsuccessful, 0 is returned.

      status = pressure.startPressure(3);
      if (status != 0)
      {
        // Wait for the measurement to complete:
        delay(status);

        // Retrieve the completed pressure measurement:
        // Note that the measurement is stored in the variable P.
        // Note also that the function requires the previous temperature measurement (T).
        // (If temperature is stable, you can do one temperature measurement for a number of pressure measurements.)
        // Function returns 1 if successful, 0 if failure.

        status = pressure.getPressure(P,T);
        if (status != 0)
        {
          // Print out the measurement:
          Serial.print("absolute pressure: ");
          Serial.print(P,2);
          Serial.print(" mb, ");
          Serial.print(P*0.0295333727,2);
          Serial.println(" inHg");

          // The pressure sensor returns abolute pressure, which varies with altitude.
          // To remove the effects of altitude, use the sealevel function and your current altitude.
          // This number is commonly used in weather reports.
          // Parameters: P = absolute pressure in mb, ALTITUDE = current altitude in m.
          // Result: p0 = sea-level compensated pressure in mb

          //p0 = pressure.sealevel(P,ALTITUDE); // we're at 1655 meters (Boulder, CO)
          //Serial.print("relative (sea-level) pressure: ");
          //Serial.print(p0,2);
          //Serial.print(" mb, ");
          //Serial.print(p0*0.0295333727,2);
          //Serial.println(" inHg");

          // On the other hand, if you want to determine your altitude from the pressure reading,
          // use the altitude function along with a baseline pressure (sea-level or other).
          // Parameters: P = absolute pressure in mb, p0 = baseline pressure in mb.
          // Result: a = altitude in m.

          //a = pressure.altitude(P,p0);
          //Serial.print("computed altitude: ");
          //Serial.print(a,0);
          //Serial.print(" meters, ");
          //Serial.print(a*3.28084,0);
          //Serial.println(" feet");
        }
        else Serial.println("error retrieving pressure measurement\n");
      }
      else Serial.println("error starting pressure measurement\n");
    }
    else Serial.println("error retrieving temperature measurement\n");
  }
  else Serial.println("error starting temperature measurement\n");

  measureSurTemp();//measure the Surrounding temperature around the sensor
  measureObjectTemp();//measure the object temperature

  delay(100);  // Pause for 5 seconds.
}

float binSearch(long x)// this function used for measure the surrounding temperature
{
  int low, mid, high;
  low = 0;
  //mid=0;
  high = 100;
  while (low <= high)
  {
    mid = (low + high) / 2;
    if (x < res[mid])
      low = mid + 1;
    else//(x>res[mid])
      high = mid - 1;
  }
  return mid;
}

float arraysearch(float x, float y) //x is the surrounding temperature,y is the object temperature
{
  int i = 0;
  float tem_coefficient = 100; //Magnification of 100 times
  i = (x / 10) + 1; //Ambient temperature
  voltage = (float)y / tem_coefficient; //the original voltage
  //Serial.print("sensor voltage:\t");
  //Serial.print(voltage,5);
  //Serial.print("V");
  for (temp3 = 0; temp3 < 13; temp3++)
  {
    if ((voltage > obj[temp3][i]) && (voltage < obj[temp3 + 1][i]))
    {
      return temp3;
    }
  }
}
float measureSurTemp()
{
  unsigned char i = 0;
  float current_temp1 = 0;
  int signal = 0;
  tempValue = 0;
  for(i=0;i<100;i++)       //
  {
  tempValue += analogRead(SUR_TEMP_PIN);
  delay(10);
  }
  tempValue=tempValue/100;      //média de 10 medições (resultado em bits)
  temp = tempValue * ((2-0.195) / (2284-85))+0.126;  //passar de bits para volts
  R = 2000000 * temp / (2.5 - temp);  //Calcular a resistência 
  signal = binSearch(R);      //De acordo com o valor da resistência ir buscar o valor da temperatura usando R-T characteristics from datasheet
  current_temp = signal - 1 + temp_calibration + (res[signal - 1] - R) / (res[signal - 1] - res[signal]); //Ter um valor mais "preciso". Assume-se que é linear entre 2 graus consecutivos
  Serial.print("Surrounding temperature:");
  Serial.print(current_temp);
  Serial.print(" ºC");
  return current_temp;
}

float measureObjectTemp()
{
  unsigned char i = 0;
  unsigned char j = 0;
  float sur_temp = 0;
  unsigned int array_temp = 0;
  float temp1, temp2;
  float final_temp = 0;
  objtValue = 0;
  for (i = 0; i < 10; i++)
  {
    objtValue += analogRead(OBJ_TEMP_PIN);
    delay(10);
  }
  objtValue = objtValue / 10; //Averaging processing
  temp1 = objtValue * ((2-0.195) / (2284-85))+0.126; //+objt_calibration;
  sur_temp = temp1 - (reference_vol + offset_vol);
  //Serial.print("\t Sensor voltage:");
  //Serial.print(sur_temp, 3);
  //Serial.print("V");
  array_temp = arraysearch(current_temp, sur_temp * 1000);
  temp2 = current_temp;
  temp1 = (temperature_range * voltage) / (obj[array_temp + 1][(int)(temp2 / 10) + 1] - obj[array_temp][(int)(temp2 / 10) + 1]);
  final_temp = temp2 + temp1;
  if ((final_temp > 100) || (final_temp <= -10))
  {
    Serial.println ("\t out of range!");
  }
  else
  {
    Serial.print("\t Patient temperature:");
    Serial.print(final_temp, 2);
    Serial.println(" ºC");
  }
}
