
//Simple radial orbit clock by Caio

float radius = 300; //set radius of larger circle (hour)

float x; //needed for creating the circles using for loop 
float y; //...

float camX; //to be mapped to mouseX
float camY; //....to mouseY

//primary time variables
float hour;
float hour12; //hour12 used to convert clocks from 24 to AM/PM time-format
float mins;
float secs;

float rot; //clock rotation offset

float rotHours; //secondary variables to be filled by equivalent-angles of time measurements
float rotMins;
float rotSecs;

void setup() {

  size(800, 800);
  smooth();
}

void draw() {
  background(20);
  noStroke();
  camX = map(mouseX, width, 0, 10, -10); 
  camY = map(mouseY, height, 0, 10, -10); 

//filling in the variables with values from machine-time
  secs = second();
  mins = minute();
  hour = hour();

//rot offsets the zero-angle of the circles by 180
  rot = 180;

//converts hour-value to 1-12 format
  if (hour > 12) hour12 = hour %12;
  else hour12 = hour;

//maps converted hour measurement to angle (in degrees)
  rotHours = map(hour12, 12, 0, 0, 360); 
  
  fill(255);

//creates circle for hours
  for (int i = 360; i>rotHours; i-=30) {
    float x = width/2 + sin(radians(i+rot))*radius;
    float y = height/2 + cos(radians(i+rot))*radius;
    ellipse(x+ camX, y+ camY, radius/10, radius/10); //ellipse radius sets thinkness of hour
  }

//maps minute to degrees
  rotMins = map(mins, 59, 0, 1, 360);
  
  fill(180);

//creates circle for minutes
  for (int i = 360; i>rotMins; i-=1) {
    float x = width/2 + sin(radians(i+rot))* (radius - (radius/8));
    float y = height/2 + cos(radians(i+rot))* (radius - (radius/8));
    ellipse(x+ (camX/3), y+ (camY/3), radius/20, radius/20); //minute thickness
  }

//maps second to degrees
  rotSecs = map(secs, 59, 0, 1, 360);
  
  fill(100);

//creates circle for seconds
  for (int i = 360; i>rotSecs; i-=1) {
    float x = width/2 + sin(radians(i+rot))* (radius - (radius/4));
    float y = height/2 + cos(radians(i+rot))* (radius - (radius/4));
    ellipse(x+ (camX/5), y+ (camY/5), radius/25, radius/25); //second thinkness
  }
}



