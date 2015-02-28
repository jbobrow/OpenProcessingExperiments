
//Cristen W, CP1, Mods 14/15, Random Walk
/*
Press and drag the left mouse button to create 3 circles that leave a trace. <br>
 Press and drag the right mouse button to create the same 3 circles without a trace.
 */

int x = 160;
int y = 220;
int w = 20;
int h = 20;
int x1 = 280;
int y1 = 280;
int x2 = 400;
int y2 = 350;

void setup()
{
  size(600, 500);
  background(198, 194, 146);
}

void draw()
{
}

void mouseDragged()
{
  if (mouseButton == LEFT)
  {
    //Circle1
    fill(255, 255, 255, 30);
    ellipse(x, y, w+40, h+40);
    fill(98, 88, 88, 30);
    ellipse(x, y, w+20, h+20);
    fill(36, 184, 164, 10);
    ellipse(x, y, w, h);
    //Circle2
    fill(36, 184, 164, 30);
    ellipse(x1, y1, w+40, h+40);
    fill(255, 255, 255, 30);
    ellipse(x1, y1, w+20, h+20);
    fill(93, 88, 88, 10);
    ellipse(x1, y1, w, h);
    //Circle3
    fill(93, 88, 88, 30);
    ellipse(x2, y2, w+40, h+40);
    fill(36, 184, 164, 30);
    ellipse(x2, y2, w+20, h+20);
    fill(255, 255, 255, 10);
    ellipse(x2, y2, w, h);
    x = x + int(random(-4, 4));
    y = y + int(random(-4, 4));
    x1 = x1 + int(random(-4, 4));
    y1 = y1 + int(random(-4, 4));
    x2 = x2 + int(random(-4, 4));
    y2 = y2 + int(random(-4, 4));
    w = w + int(random(-4, 4));
    h = h = int(random(-4, 4));
  }
  else if (mouseButton ==RIGHT)
  {
    fill(198, 194, 146);
    rect(0, 0, 600, 500);
    //Circle1
    fill(255, 255, 255);
    ellipse(x, y, w+40, h+40);
    fill(98, 88, 88);
    ellipse(x, y, w+20, h+20);
    fill(36, 184, 164);
    ellipse(x, y, w, h);
    //Circle2
    fill(36, 184, 164);
    ellipse(x1, y1, w+40, h+40);
    fill(255);
    ellipse(x1, y1, w+20, h+20);
    fill(93, 88, 88);
    ellipse(x1, y1, w, h);
    //Circle3
    fill(93, 88, 88);
    ellipse(x2, y2, w+40, h+40);
    fill(36, 184, 164);
    ellipse(x2, y2, w+20, h+20);
    fill(255);
    ellipse(x2, y2, w, h);
    x = x + int(random(-4, 4));
    y = y + int(random(-4, 4));
    x1 = x1 + int(random(-4, 4));
    y1 = y1 + int(random(-4, 4));
    x2 = x2 + int(random(-4, 4));
    y2 = y2 + int(random(-4, 4));
    w = w + int(random(-4, 4));
    h = h = int(random(-4, 4));
  }
}
