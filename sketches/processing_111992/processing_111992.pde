
float timer = 0;
float angle = 0.0;
float s = 0;
float e = 0.3;
void setup()
{
  size(500, 500);
}

void draw()
{
  timer = timer + 0.0167;
  
  if (timer > 5)
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
  }
  

  if (timer > 9)
  {
    pushMatrix();
    rotate(angle);
    triangle(130, 75, 158, 20, 186, 75);
    popMatrix();
  }
  
  //scaling up and down repeatedly
  if (timer > 7)
  {
    pushMatrix();
    translate(350, 350);
    scale(s, s);
    rect(0, 0, 50, 50);
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

  
else
{
  pushMatrix();
  rotate(angle);
  quad(338, 31, 386, 20, 369, 63, 330, 76);
  popMatrix();
}

//using sin to create a wave effect
  int centX = width/2;
  int centY = height/2;
  float radius = 150;
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


