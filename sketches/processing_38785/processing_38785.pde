
/* Title        : Planets
   Synopsis     : Small Planet demo, with limited elliptical orbits
   Author       : Michael Hawthorne
   Version      : 0.1
   ChangeLog    : 
*/
int xpoint = 300;
int ypoint = 300;

float ALPHA = 0.5;
float Angle = 3.14159;
float angle;
float newAngle = 0;
int Iter = 0;
float x,y;

void setup()
{
  size(600,600);
  background(0,0,0);
  smooth();
  
}


void draw()
{
  background(0);
  strokeWeight(30);
  stroke(192,192,20);
  point(xpoint, ypoint);
  
  //mercury
  newAngle = PI - ((Iter / 0.2)/ 114.591);
  float angle = ALPHA * newAngle + (1-ALPHA) * Angle;
  x = xpoint + 20 * cos(angle);
  y = ypoint + 22 * sin(angle);
  strokeWeight(2);
  stroke(233,164,35);
  point(x,y);
  
  //Venus
  newAngle = PI - ((Iter / 0.3) / 114.591);
  angle = ALPHA * newAngle + (1-ALPHA) * Angle;
  x = xpoint + 35 * cos(angle);
  y = ypoint + 38 * sin(angle);
  strokeWeight(5);
  stroke(172,123,35);
  point(x,y);
  
  //Earth
  newAngle = PI - ((Iter / 0.5) / 114.591);
  angle = ALPHA * newAngle + (1-ALPHA) * Angle;
  x = xpoint + 60 * cos(angle);
  y = ypoint + 65 * sin(angle);
  strokeWeight(6);
  stroke(14,121,228);
  point(x,y);
  
  //Moon
  newAngle = PI - ((Iter / 0.07) / 114.591);
  angle = ALPHA * newAngle + (1-ALPHA) * Angle;
  float v = x + 9 * cos(angle);
  float z = y + 10 * sin(angle); 
  strokeWeight(2);
  stroke(240,240,240);
  point(v ,z);
  
  
  //mars
  newAngle = PI - ((Iter / 1.0) / 114.591);
  angle = ALPHA * newAngle + (1-ALPHA) * Angle;
  x = xpoint + 90 * cos(angle);
  y = ypoint + 92 * sin(angle);
  strokeWeight(3);
  stroke(255,120,35);
  point(x,y);
  
  //Jupiter
  newAngle = PI - ((Iter / 2.5) / 114.591);
  angle = ALPHA * newAngle + (1-ALPHA) * Angle;
  x = xpoint + 220 * cos(angle);
  y = ypoint + 215 * sin(angle);
  strokeWeight(40);
  stroke(213,176,123);
  point(x,y);
  stroke(250,176,123);
  strokeWeight(1);
  ellipse(x-9,y+9, 8,3);
  
  //Saturn
  newAngle = PI - ((Iter / 3.6) / 114.591);
  angle = ALPHA * newAngle + (1-ALPHA) * Angle;
  x = xpoint + 300 * cos(angle);
  y = ypoint + 320 * sin(angle);
  
  strokeWeight(5);
  stroke(213,176,123);
  ellipse(x,y,40,5);
  strokeWeight(20);
  stroke(240,176,123);
  point(x,y);
  
  
  Iter++;
  
  
  
  
  
}
                
                
