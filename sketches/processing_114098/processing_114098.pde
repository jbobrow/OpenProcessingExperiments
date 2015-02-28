
/* Modified implementation of http://processing.org/examples/clock.html */
/* Styled to look like classic Swiss clock (Mondaine) */

int SIZE = 600;
int cX, cY;
float sR, mR, hR, cD;

void setup()
{
  size(SIZE,SIZE);
  strokeCap(SQUARE);
  
  int radius = SIZE/2;
  sR = radius * 0.82;
  mR = radius * 0.6;
  hR = radius * 0.7;
  cD = radius * 1.8;
  
  cX = width/2;
  cY = height/2;
}

void draw()
{
  if (mousePressed)
  {
    noLoop(); 
  }
  else
  {
    loop();
  }
  
  background(230);
  
  drawClockBG();
  drawTicks();
  drawHands();
}

void drawClockBG()
{
  stroke(180);
  strokeWeight(5);
  fill(255);
  ellipse(cX,cY,cD,cD);
}

void drawTicks()
{
  float x,y,angle;
  // Draw the minute ticks
  beginShape(LINES);
  for (int a = 0; a < 360; a+=6) {
    strokeWeight(2);
    stroke(180);
    
    angle = radians(a);
    x = cX + cos(angle) * (sR+10);
    y = cY + sin(angle) * (sR+10);
    vertex(x, y);
    
    if (a0 != 0)
    {
      x = cX + cos(angle) * sR;
      y = cY + sin(angle) * sR;
    }
    else
    {
      strokeWeight(8);
      stroke(70);
      x = cX + cos(angle) * (sR-20);
      y = cY + sin(angle) * (sR-20);
    } 
    
    vertex(x, y);
  }
  endShape();
}

void drawHands()
{
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  // Hours
  stroke(70,255);
  strokeWeight(10);
  line(cX, cY, cX + cos(h) * hR, cY + sin(h) * hR);
  
  // Minutes
  stroke(70, 200);
  strokeWeight(10);
  line(cX, cY, cX + cos(m) * (mR+60), cY + sin(m) * (mR+60));
  
  // Seconds
  stroke(255,0,0);
  strokeWeight(3);
  line(cX, cY, cX + cos(s) * (sR-30), cY + sin(s) * (sR-30));
}
