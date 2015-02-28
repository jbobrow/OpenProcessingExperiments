
/**
 * Inspired by Hack-A-Day article http://hackaday.com/2012/01/25/very-accurate-clock-cant-be-read-accurately/.
 *
 * There are two modes that can be selected by the first line of code.
 *   Set helpScreen to false to just see the clock.
 *   Set helpScreen to true to show the clock and the color wheel.
 *
 * Author: matthew@densons.org
 * Date: Feb 2, 2012
 */

boolean helpScreen = false;

// help wheel consts
int segs = 360;
int steps = 12;
float rotAdjust = (TWO_PI / segs / 2) - HALF_PI;
float interval = TWO_PI / segs;

// clock variables
int second  = 0, minute = 0, hour = 0;
int weekDay = 1;

double value_night = 0.5;
double value_day   = 0.9;

long startOfSecond = 0;
double value = value_day;
int red=0, green=0, blue=0;

void setup() {
  startOfSecond = millis();
  getClock();

  if (!helpScreen) {
    size(400, 100);
  } else {
    size(400, 500);
  }
}

void getClock() {
  second = second();
  minute = minute();
  hour = hour();;
  weekDay = dayofweek();   
}

/*
 * Find the day of the week using the Gaussian algorithm
 *  w = ((d + (2.6m - 0.6) + y + (y/4) + (c/4) - 2c) mod 7) + 1
 *
 * where
 *   Y: year-1 for  January or February, 
 *      year   for  the rest of the year
 *   d: day (1 to 31)
 *   m: shifted month (March=1,...February=12), i.e. ((month + 9) % 12) + 1     
 *   y: last 2 digits of Y
 *   c: first 2 digits of Y
 *   w: day of week (1=Sunday,..7=Saturday)
 */
int dayofweek() {
  int day = day();
  int month = month();
  int year = year();
  
  if (month < 3) {
    year = year - 1;
    month = ((month + 9) % 12) + 1;
  }
  
  int y = year % 100;
  int c = year / 100;
  
  return int((day + ((2.6*month) - 0.6) + y + (y/4) + (c/4) - 2*c) % 7) + 1;
}

void draw() {
  background(255);    
  stroke(0);          
  strokeWeight(1);

  if (millis() - startOfSecond >= 1000) {
    startOfSecond = millis();
    getClock();
  }

  float t_sec   = (millis()-startOfSecond)/1000.0;
  float t_10sec = second%10/10.0 + t_sec/10;       // square 0
  float t_min   = second/60.0 + t_sec/60;          // square 1
  float t_hour  = minute/60.0 + t_min/60;          // square 2
  float t_day   = hour/24.0 + t_hour/24;           // square 3
  float t_week  = weekDay/7.0  + t_day/7.0;            // square 4

  // dims the clock at night. Minimum value at midnight. Maximum value at Noon.
  value = value_night;
  value += (value_day-value_night)*0.5;
  value += (value_day-value_night)*0.5*Math.sin( t_day * 2 * PI );

  red=0; green=0; blue=0;

  convertHSVtoRGB((int)(t_week*360), 1.0, value);
  fill(red, green, blue);          
  rect(0,0,100,100);

  convertHSVtoRGB((int)(t_day*360), 1.0, value);
  fill(red, green, blue);          
  rect(100,0,100,100);

  convertHSVtoRGB((int)(t_hour*360), 1.0, value);
  fill(red, green, blue);          
  rect(200,0,100,100);

  convertHSVtoRGB((int)(t_min*360), 1.0, value);
  fill(red, green, blue);          
  rect(300,0,100,100);

//  convertHSVtoRGB((int)(t_10sec*360), 1.0, value);
//  fill(red, green, blue);          
//  rect(400,0,100,100);

  if (helpScreen) {
    smooth();
    ellipseMode(RADIUS);
    noStroke();
    // make the diameter 90% of the sketch area
    float radius = min(width, height) * 0.45;
    
    drawShadeClock(radius, value);
  }
}

void drawShadeClock(float radius, double value) {
  float cx = width - (radius*1.1), cy = height - (radius*1.1);
  float secondsRadius = radius * 0.9;
  float minutesRadius = radius * 0.85;
  float hoursRadius = radius * 0.60;
  float segWidth = radius / steps;
  
  for (int j = 0; j < steps; j++) {
    for (int i = 0; i < segs; i++) {
      if (j == 0) {
        convertHSVtoRGB(i, 1.0, value);
      } else {
        red = 255; blue = 255; green = 255;
      }
      fill(red, green, blue);
      arc(cx, cy, radius, radius, 
          interval*i+rotAdjust, interval*(i+1)+rotAdjust);
    }
    radius -= segWidth;
  }

  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI) - HALF_PI;
  
  // Draw the hands of the clock
  stroke(0);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);

  // Draw the minute ticks
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float x = cx + cos(radians(a)) * secondsRadius;
    float y = cy + sin(radians(a)) * secondsRadius;
    vertex(x, y);
  }
  endShape();
}

//Convert a given HSV (Hue Saturation Value) to RGB (Red Green Blue)
//  h is hue value, integer between 0 and 360
//  s is saturation value, double between 0 and 1
//  v is value, double between 0 and 1
//http://splinter.com.au/blog/?p=29
void convertHSVtoRGB(int h, double s, double v) {
  //this is the algorithm to convert from RGB to HSV
  double r=0; 
  double g=0; 
  double b=0;

  double hf=h/60.0;

  int i=(int)floor(h/60.0);
  double f = h/60.0 - i;
  double pv = v * (1 - s);
  double qv = v * (1 - s*f);
  double tv = v * (1 - s * (1 - f));

  switch (i)
  {
  case 0: //red dominante
    r = v;
    g = tv;
    b = pv;
    break;
  case 1: //green
    r = qv;
    g = v;
    b = pv;
    break;
  case 2: 
    r = pv;
    g = v;
    b = tv;
    break;
  case 3: //blue
    r = pv;
    g = qv;
    b = v;
    break;
  case 4:
    r = tv;
    g = pv;
    b = v;
    break;
  case 5: //red
    r = v;
    g = pv;
    b = qv;
    break;
  }

  //set each component to a integer value between 0 and 255
  red=constrain((int)(255*r),0,255);
  green=constrain((int)(255*g),0,255);
  blue=constrain((int)(255*b),0,255);
}


