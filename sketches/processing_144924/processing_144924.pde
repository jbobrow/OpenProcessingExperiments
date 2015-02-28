
import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;
import processing.serial.*;
//WARNING: Code will not work on first try. Do not modify any lines of code, and try again.
//if all else fails, rebooting processing will fix most errors. this is a result of a "silent"
//fail" created by processing's infrastructure. It has several fixes, but they cannot be implemented
//within the timeframe. The "started && myport != null" clause prevents some of them.

/*
This code (yes, all of it) was frankensteined from a variety of libraries.
•The toroid shape is shamelessly stolen from the 3dShapes processing library.
the best 3d modeling library the world will ever know. 
•The compass calculating code is based upon 3 libraries designed for the LSM303,
as shown in the arduino code. the libraries can be found at:
github.com/adafruit/Adafruit_LSM303
github.com/pololu/lsm303-arduino
github.com/adafruit/Adafruit_Sensor (this is a unified sensor library; contains extra stuff.)
•the accelerometer code is based upon Ms. Freed's very helpful smoothing code, 
found on her github. 
•the LED strand code is developed upon Adafruit's extremely unique LPD8806 library,
found at github.com/adafruit/LPD8806
•there was a nifty bit of hsb to rgb conversion which is borrowed from:
http://www.johngineer.com/blog/?p=1022
*/

Serial myPort;

Toroid xDonut;
Toroid yDonut;
Toroid zDonut;
float[] values ={0,0};
String[] sValues;
float yAccel;
float heading;
color ledColor;
int ledLocation;
int h,s,b,colorTilt;
int numLEDS = 26;
float center = 0; //user defined center, not necessarily north as set
boolean calibrated = false;
int xRotation;
boolean started = false;
float angleX, angleY, angleZ;
float posY; //height on screen

void setup() {
  size(400, 400, P3D);
  println(Serial.list());
  noStroke();
  colorMode(HSB, 255); //necessary for later color uses
  //processing's X, user Z
  angleX = -0.2; //gives the toroid its 3d look
  //processing's Y, user's X
  angleY = 0; //not actually the Y axis
  //processing's Z, user's Y
  angleZ = 0; //not actually the Z axis
  xDonut = new Toroid(this, 6, 20);
  yDonut = new Toroid(this, 6, 20);
  zDonut = new Toroid(this, 6, 20);
  drawME(xDonut, "x");
  drawME(yDonut, "y");
  drawME(zDonut, "z");
  myPort = new Serial(this, Serial.list()[13], 9600); //set port number as desired, mine is always 13
  myPort.bufferUntil('\n');
  started = true;
  //noLoop(); draw is not the problem
}

void keyPressed(){ if (key == 'c' || key == 'C') calibrated = false;} //user must do this, processing has issues man.

void draw() { //though this conflicts with serial event occasionally, Serial is sufficiently slow to not be an issue. 
  
  background(200);
  if (xDonut != null) {
    xDonut.stroke(color(h, 255, 255));
    yDonut.stroke(color(h, 255, 255));
    zDonut.stroke(color(h, 255, 255));
    xDonut.draw(); //you need these, trust me.
    yDonut.draw();
    zDonut.draw();
    update();
  }
}

void drawME(Toroid donut, String axis) { // sets the overall look and feel of the toroids.

  donut.fill(color(0, 0, 0));
  donut.stroke(color(127, 255, 255));
  donut.strokeWeight(1.2);
  donut.setRadius(10, 10, 50.0);
  donut.drawMode(Shape3D.SOLID | Shape3D.WIRE);
  donut.moveTo(200, 200, 0);
  donut.rotateTo(0, 0, 0);
  if (axis.equals("z")) {
    donut.rotateTo(angleX, angleY, angleZ);
  }
  if (axis.equals("y")) {
    donut.rotateTo(angleX, angleY, angleZ+(PI/2));
  }
  if (axis.equals("x")) {
    donut.rotateTo(angleX, angleY+(PI/2), angleZ+(PI/2));
  }
}

void serialEvent (Serial myPort) { //where the magic happens.
  if (started && myPort != null) { //this is a hack, better option forthcoming.
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');
  
  if (inString != null) {
    
    // trim off any whitespace:
    inString = trim(inString);
    //split for many values coming through
    sValues = split(inString, ',');
    //first values is the y axis of the single accelerometer, used to determine arm height
    //yAccel = float(sValues[0]);
    yAccel = Float.parseFloat(sValues[0]); //these parse float lines are the biggest issue in causing the error
    //heading = float(sValues[1]);
    heading = Float.parseFloat(sValues[1]);
    //xRotation = int(sValues[2]);
    xRotation = Integer.parseInt(sValues[2]);
    
    //yAccel = .2;
    //heading = 220;
    //xRotation = -3000;

    heading = map(heading, 0, 360, 0, TWO_PI); //convirting to radians the old fashioned way
    posY = -1*map(yAccel, -.1, 1.5,-100, 100) + width/2;//the "magic numbers" here are dependent on screen size and sensor.
    colorTilt = (int)map(xRotation, -16000, 16000, 0, 255);
    colorTilt = constrain(colorTilt, 0, 255);
    h = colorTilt;
    //println(colorTilt);
    //println(yAccel);
    //println(heading);
    angleY = -heading;//rotates toroid correctly
    
    if (!calibrated) {
     center = heading; //makes more intuitive to user
     calibrated = true; 
    }
    
    heading -= center;
    //0-90 is 13-26
    //270-360 is 0-13
    //90-180 is 26-13
    //270-180 is 0-13
    /*if (heading >= TWO_PI) {
      heading -= TWO_PI;
    } else if (heading < 0) {
       heading = TWO_PI + heading; 
    }*/ //this block is not necessary when using cosine
    
    b = (int)map(yAccel, -1, 1.5, 0, 255); //brightness value
    ledLocation = (int)map(-cos(heading+HALF_PI), -1, 1, 1, numLEDS+1); 
    //println(ledLocation);
  }
  }
}

void update() {
  zDonut.rotateTo(angleX, angleY, angleZ);
  yDonut.rotateTo(angleX, angleY, angleZ+(PI/2));
  xDonut.rotateTo(angleX, angleY+(PI/2), angleZ+(PI/2)); //I know this line seems wrong, but the angles have 2 references
  zDonut.moveTo(200,posY,0);
  yDonut.moveTo(200,posY,0);
  xDonut.moveTo(200,posY,0);
  ledColor = color(h, 255, b);
  fill(ledColor);
  rect(ledLocation*(width/numLEDS)-20,height-20,20,20); 
}


//** ARDUINO CODE!
//PLEASE follow the given pin layout!!!

/*


#include <Wire.h>
#include <LSM303.h>
#include "LPD8806.h"
#include "SPI.h"
int nLEDs = 26;
int dataPin  = 2;
int clockPin = 3;

LSM303 compass;
LPD8806 strip = LPD8806(nLEDs, dataPin, clockPin);
float x;
const int numReadings = 2;
int index;
float readings[numReadings];
float total = 0;
float average = 0;
float nHeading = 0;
float center = 0;
int b, ledI colorTilt;
uint8_t rgbColor[3];
boolean calibrated = false;

void setup() {
  Serial.begin(9600);
  Wire.begin();
  compass.init();
  compass.enableDefault();
  pinMode(12, INPUT_PULLUP);
  
  for (int thisReading = 0; thisReading < numReadings; thisReading++)
    readings[thisReading] = 0;    //clear array so averages work smoothly      

   // Start up the LED strip
  strip.begin();

  // Update the strip, to start they are all 'off'
  strip.show();
  
//  Calibration values; the default values of +/-32767 for each axis
//   lead to an assumed magnetometer bias of 0. Use the Calibrate example
//   program to determine appropriate values for your particular unit.
//   
  //compass.m_min = (LSM303::vector<int16_t>){-32767, -32767, -32767};
  //compass.m_max = (LSM303::vector<int16_t>){+32767, +32767, +32767};
  compass.m_min = (LSM303::vector<int16_t>){
    -692, -557, -498  };  //these values were calculated for my sensor, you may use the ones above to greater effect.
  compass.m_max = (LSM303::vector<int16_t>){
    +386, +556, +498  };
}

void loop() {
  x = analogRead(A0);
  compass.read();

  
  float tiltAngle = -(((x * 3.3) / 1023) - 1.65) / 0.8; //this calculation involves gravity and voltages.
  Serial.print(tiltAngle);
  Serial.print(",");
  
  
//  When given no arguments, the heading() function returns the angular
//   difference in the horizontal plane between a default vector and
//   north, in degrees.
//   
//   The default vector is chosen by the library to point along the
//   surface of the PCB, in the direction of the top of the text on the
//   silkscreen. This is the +X axis on the Pololu LSM303D carrier and
//   the -Y axis on the Pololu LSM303DLHC, LSM303DLM, and LSM303DLH
//   carriers.
//   
//   To use a different vector as a reference, use the version of heading()
//   that takes a vector argument; for example, use
//   
//   compass.heading((LSM303::vector<int>){0, 0, 1});
//   
//   to use the +Z axis as a reference.
   
  //float heading = compass.heading();
  //Serial.println(heading);
  //start smoothing code
  total = total - readings[index];         
  // read from the sensor:  
  readings[index] = compass.heading(); 
  // add the reading to the total:
  total= total + readings[index];       
  // advance to the next position in the array:  
  index = index + 1;                    

  // if we're at the end of the array...
  if (index >= numReadings) index = 0;                           
  // calculate the average:
  average = total / numReadings;         
  // send it to the computer as ASCII digits
  Serial.print(average); 
  // end smoothing code
  Serial.print(",");
  Serial.print(compass.a.x);
  Serial.println();
  if (!calibrated){
   center = compass.heading();
   calibrated = true; 
  }
  nHeading = average - center;
  //Serial.println(heading);
  //b = (int)map(tiltAngle*100, -50, 1500, 0, 127); FEEDBACK CHANGES new line below
  b = (int)map(tiltAngle*100, -50, 1000, 0, 127); 
  b = contstrain(b, 0, 127); //turns out that cutting out the top range and constraining works well
  ledI = round(map(-100*cos(((nHeading*71)/4068)+1.57), -100, 100, 0, nLEDs)); //I CANNOT STRESS THIS ENOUGH: DO NOT MAP WITH DECIMALS
  if (ledI > nLEDs) ledI = nLEDs;
  colorTilt = (int)map(compass.a.x, -16000, 16000, 0, 767);
  colorTilt = constrain(colorTilt, 0, 767);
  hsb2rgb(colorTilt, 255, b, rgbColor);
  strip.setPixelColor(ledI, strip.Color(rgbColor[0],rgbColor[1],rgbColor[2])); // Set new pixel 'on'
  if (ledI > 0) strip.setPixelColor(ledI-1, strip.Color(rgbColor[0],rgbColor[1],rgbColor[2]));
  if (ledI < nLEDs) strip.setPixelColor(ledI+1, strip.Color(rgbColor[0],rgbColor[1],rgbColor[2]));
  strip.show();
  strip.setPixelColor(ledI, strip.Color(0,0,0));
  if (ledI > 0) strip.setPixelColor(ledI-1, strip.Color(0,0,0));
  if (ledI < nLEDs) strip.setPixelColor(ledI+1, strip.Color(0,0,0));
  delay(100);
}

void hsb2rgb(uint16_t index, uint8_t sat, uint8_t bright, uint8_t color[3])
{
  uint16_t r_temp, g_temp, b_temp;
  uint8_t index_mod;
  uint8_t inverse_sat = (sat ^ 255);

  index = index % 768;
  index_mod = index % 256;

  if (index < 256)
  {
    r_temp = index_mod ^ 255;
    g_temp = index_mod;
    b_temp = 0;
  }

  else if (index < 512)
  {
    r_temp = 0;
    g_temp = index_mod ^ 255;
    b_temp = index_mod;
  }

  else if ( index < 768)
  {
    r_temp = index_mod;
    g_temp = 0;
    b_temp = index_mod ^ 255;
  }

  else
  {
    r_temp = 0;
    g_temp = 0;
    b_temp = 0;
  }

  r_temp = ((r_temp * sat) / 255) + inverse_sat;
  g_temp = ((g_temp * sat) / 255) + inverse_sat;
  b_temp = ((b_temp * sat) / 255) + inverse_sat;

  r_temp = (r_temp * bright) / 255;
  g_temp = (g_temp * bright) / 255;
  b_temp = (b_temp * bright) / 255;

  color[0]   = (uint8_t)r_temp;
  color[1]  = (uint8_t)g_temp;
  color[2]  = (uint8_t)b_temp;
}
*/

