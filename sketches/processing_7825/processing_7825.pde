
//cmsc117_clock_NATHANSMALLWOOD.pde

float a = map(second(), 0, 60, 0, 360);
float b = map(minute(), 0, 60, 0, 360);
float c = map(hour() % 12, 0, 12, 0, 360);
float angle;

void setup()
{
  size(600, 600);
  smooth();
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  rotate(radians(-90));
  
  //background
  strokeWeight(1);
  stroke(255);
  float radius = 1;
  float cx = 0;
  float cy = 0;
  float px = cx;
  float py = cy;
  pushMatrix();
  rotate(radians(angle));
  for (int deg = 0; deg < 360 * 1000; deg ++)
  {
    float angle = radians(deg);
    float x = cx + (cos(angle) * radius);
    float y = cy + (sin(angle) * radius);
    line(px, py, x, y);
    radius = radius * 1.00005;
    px = x;
    py = y;
  }
  popMatrix();
  angle = angle + 10;
 
  //hour hand
  strokeWeight(2);
  float h = map(hour() % 12, 0, 12, 0, 360);
  for (float c = 0; c < 360; c ++)
  {
    stroke(0, 255 - map(c, 0, 180, 0, 255));
    line(cos(radians(h - c)) * 150, sin(radians(h - c)) * 150, 
         cos(radians(h - c)) * 500, sin(radians(h - c)) * 500);
  }
  
  //minute hand
  strokeWeight(3);
  float m = map(minute(), 0, 60, 0, 360);
  for (float b = 0; b < 360; b ++)
  {
    stroke(0, 255 - map(b, 0, 180, 0, 255));
    line(cos(radians(m - b)) * 200, sin(radians(m - b)) * 200, 
         cos(radians(m - b)) * 500, sin(radians(m - b)) * 500);
  }
  
  //second hand
  strokeWeight(4);
  float s = map(second(), 0, 60, 0, 360);
  for (float a = 0; a < 360; a ++)
  {
    stroke(0, 255 - map(a, 0, 180, 0, 255));
    line(cos(radians(s - a)) * 250, sin(radians(s - a)) * 250,
         cos(radians(s - a)) * 500, sin(radians(s - a)) * 500);
  }
}

