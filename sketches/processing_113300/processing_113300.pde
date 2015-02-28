
float hue = 0;
float timer = 0;
float angle = 0.0;
float s = 0;
float e = 0.3;

void setup()
{
  size(500, 500);
  background(#000000);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  timer = timer + 0.0167;
  
  //Phase 1: Rotating a Square
  if (timer > 0)
  {
    angle += 0.1;
      if (angle > TWO_PI)
      {
        angle = 0;
      }
    rectMode(CENTER);
    pushMatrix();
    translate(250, 250);
    rotate(angle);
    rect(0, 0, 100, 100);
    popMatrix();
      
      //Phase 2: Scaling a square
      if (timer > 5)
    {
      rectMode(CENTER);
      pushMatrix();
      translate(250, 250);
      scale(s, s);
      rotate(angle);
      rect(0, 0, 100, 100);
      popMatrix();
      s += e;
       if (s > 2)
       {
        e = - 0.3;
       }
       if (s < 0.5)
       {
         e = 0.3;
       }
    }
     
     //Phase 3: Cycling through colors
     if (timer > 10)
     {
      rectMode(CENTER);
      pushMatrix();
      translate(250, 250);
      //scale(s, s);
      rotate(angle);
      rect(0, 0, 100, 100);
      popMatrix();
      hue = hue + 1;
      for (int i = 0; i < 360; i = i + 1)
     {
      float percent = i / (float)360;
      stroke(hue, 100, 100 * percent);
      fill(hue, 100, 100);
      //line(i, 0, i, height);
     }
     
     if (hue >= 360)
      {
        hue = 0;
      }
      drawCircle(100);
      drawCircle(50);
      drawCircle(200);
     }
  }  
}

void drawCircle(float radius)
{
  int centX = width/2;
  int centY = height/2;
  
  float x, y;
  float lastx = centX + (radius * cos(0));
  float lasty = centY + (radius * sin(0));
  for (float ang = 0; ang <=360; ang += 5)
  {
    float rad = radians(ang);
    x = centX + (radius * cos(rad) + random(-10, 10));
    y = centY + (radius * sin(rad) + random(-2, 2));
    line(lastx, lasty, x, y);
    lastx = x;
    lasty = y;
  }
}



