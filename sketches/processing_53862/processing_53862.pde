
void setup()
{
  size(800, 400);
  smooth();
  colorMode(HSB, 360, 100, 100);
  noStroke();
  background(0);
}

void draw()
{
}

void mousePressed()
{
  int x = mouseX;
  int y = mouseY;
  float w = random(75, 200);
  float h = random(50, 200);
  float grey = random(37, 89);
  float huu = random(0, 355);
  float angle = random(180, 270);

  robot(x, y, w, h, huu, angle, grey);
}

void robot(int x, int y, float w, float h, float huu, float angle, float grey)
{
  fill(huu, 255, 255, 150);

  for (float i = 11; i <= w-5; i = (i+(w/25-2))*1.11)
  {
    for (float j = 0; j >= h*-8; j = (((w/25)-2)-j)*-1.11)
    {
      arc(x+i-(w/2), y+j-10, w/10, w/10, radians(angle), radians(360-(angle-180)));
    }
  }
  
  fill(huu-10, 255, 255, 150);

  for (float i = 11; i <= w-5; i = (i+(w/25-2))*1.098)
  {
    for (float j = 0; j >= h*-8; j = (((w/25)-2)-j)*-1.098)
    {
      arc(x+i-(w/2), y+j-10, w/10, w/10, radians(angle), radians(360-(angle-180)));
    }
  }
  
    fill(huu+10, 255, 255, 150);

  for (float i = 11; i <= w-5; i = (i+(w/25-2))*1.101)
  {
    for (float j = 0; j >= h*-8; j = (((w/25)-2)-j)*-1.101)
    {
      arc(x+i-(w/2), y+j-10, w/10, w/10, radians(angle), radians(360-(angle-180)));
    }
  }

  fill(0, 0, grey);
  arc(x, y, w, w, radians(180), radians(360));

  //  fill(334, 25, 96);
  //  arc(x, y-(h/7), h/10, h/10, radians(180), radians(360));

  fill(359, 100, 100);
  ellipse(x-(w/4), y-(h/6), h/13, h/13);
  ellipse(x+(w/4), y-(h/6), h/13, h/13);
}


