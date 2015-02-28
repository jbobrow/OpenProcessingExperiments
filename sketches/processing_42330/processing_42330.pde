
/*
Daniel Li
Left Click for Fire, release and observe
Right Click for Water, release and observe
Middle Button to reset
*/

snow[] s;
float bgcolor;

void setup()
{
  size(450, 450);
  smooth();

  s = new snow[750];
  for (int i = 0; i<750; i++)
  {
    s[i] = new snow();
    s[i].x = random(0, 450);
    s[i].y = random(-250, 450);
    s[i].x1 = random(0, 450);
    s[i].y1 = random(-250, 450);
    s[i].a = -3;
    s[i].d = 3;
    s[i].s1 = 5;
    s[i].s2 = 5;
    s[i].r = 255;
    s[i].g = 255;
    s[i].b = 255;
  }
  color bgcolor = color(0);
}

void draw()
{
  fill(bgcolor, 15);
  rect(0, 0, 450, 450);
  for (int i =0;i<height;i++)
  {
    s[i].show();
    s[i].fall();
    s[i].resetD();
    s[i].resetE();
    s[i].fire();
    s[i].water();
    s[i].restart();
    //s[i].grow();
  }
}

class snow
{
  float x, y, x1, y1, a, d, s1, s2, r, g, b;

  void show()
  {
    noStroke();
    fill(r, g, b, 150);
    ellipse(x, y, s1, s2);
    fill(r, g, b, 150);
    ellipse(x1, y1, s1, s2);
  }
  void fall()
  {
    x += random(a, d);
    y += random(0, 3);
    x1 += random(a, d);
    y1 -= random(0, 3);
  }
  void resetD()
  {
    if (y>550)
    {
      y = -50;
    }
  }
  void resetE()
  {
    if (y1<-30)
    {
      y1 = 500;
    }
  }
  void grow()
  {
    s1 += 0.5;
    s2 += 0.5;
    if (s1 > 100 && s2 > 100)
    {
      s1 = 5;
      s2 = 5;
    }
  }
  void fire()
  {
    if (mousePressed  == true &&(mouseButton == LEFT))
    {
      bgcolor = color(255);
      r = random(250, 255);
      g = random(0, 200);
      b = random(0, 3);
      x = mouseX+random(-50, 50);
      y = mouseY+random(0, 50);
      x1 = mouseX+random(-50, 50);
      y1 = mouseY+random(50, 100);
    }
  }
  void water()
  {
    if (mousePressed &&(mouseButton == RIGHT))
    {
      bgcolor = color(255);
      r = random(0, 3);
      g = random(0, 200);
      b = random(250, 255);
      x = mouseX+random(-50, 50);
      y = mouseY+random(0, 50);
      x1 = mouseX+random(-50, 50);
      y1 = mouseY+random(50, 100);
    }
  }
  void restart()
  {
    if (mousePressed && (mouseButton == CENTER))
    {
      setup();
    }
  }
}


