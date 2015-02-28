
int sunRadius = 60;
int xStart = -sunRadius; // x pos
int yStart = 40;         // y pos
float xSun = xStart;     // x sun pos
float ySun = yStart;     // y sun pos


float t = 0;   // Start time of arc
float duration = 60 * 1000; // Circle (Rotation)
float conversionFactor = 2 * 3.14 / duration; // 2xpi for rotation

void setup()
{
  size(400, 400); // Canvas size
}

void draw()
{
  
  background(#1BDEF2);

  
  fill(#F6FF00); // sun color
  ellipse(xSun, ySun, sunRadius, sunRadius);
fill(#E31B1B);
 triangle(150, 50, 0, 150, 300, 150);
 fill(#CBAB06);
 rect(0, 150, 300, 200);
 fill(0);
   rect(100, 200, 100, 150); //house
   
 
 
  
  t = millis() * conversionFactor; // coverting time to milliseconds

  // limiting the rotation of the sun, keeping it on the canvas, circle.
  float Rx = width/2 + sunRadius/2;
  float Ry = height/2 - sunRadius/2;
  float centerX = width/2;
  float centerY = height/2;

  xSun = cos(t) * Rx + centerX;
  ySun = sin(t) * Ry + centerY;
  fill(#11D312);
  rect(0, 300, 400, 100);//grass 
}







