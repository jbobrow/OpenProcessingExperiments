

ArrayList rectangles;
boolean reproduced;
boolean autoRestart;

void setup()
{
  size(600, 400, P2D);
  frameRate(40);
  colorMode(HSB, 200);
  noStroke();
  restart();
  autoRestart = true;
}

void restart()
{
  background(0);
  rectangles = new ArrayList();
  rectangles.add(new Rectangle(0, 0, (float)width, (float)height, color(random(200), random(100, 150), random(100, 150))));
  reproduced = false;
}

void mouseReleased()
{
  restart();
}

void keyPressed()
{
  if(key == 65 || key == 97)
    autoRestart = !autoRestart;
}

void draw()
{
  reproduced = false;
  for(int i = 0; i < rectangles.size(); i++)
  {
    Rectangle r = (Rectangle) rectangles.get(i);
    if(r.alive)
    {
      r.drawRectangle();
      r.reproduce();
      reproduced = true;
    }
    else
      rectangles.remove(i);
  }
  
  if(!reproduced && autoRestart)
    restart();
}

class Rectangle
{
  PVector position;
  float w, h;
  color clr;
  boolean alive;
  
  protected Rectangle(float x, float y, float wth, float hgt, color c)
  {
    position = new PVector(x, y);
    w = wth;
    h = hgt;
    clr = c;
    alive = true;
  }
  
  public void reproduce()
  {
    if(w > 1 && h > 1)
    {
      if(random(100) < 10)
      {
        rectangles.add(new Rectangle(position.x, position.y, w/2, h/2, getColorVariation(clr)));
        rectangles.add(new Rectangle(position.x, position.y + (h/2), w/2, h/2, getColorVariation(clr)));
        rectangles.add(new Rectangle(position.x + (w/2), position.y, w/2, h/2, getColorVariation(clr)));
        rectangles.add(new Rectangle(position.x + (w/2), position.y + (h/2), w/2, h/2, getColorVariation(clr)));
        alive = false;
      }
    }
    else
    {
      alive = false;
    }
  }
  
  private color getColorVariation(color c)
  {
    float h = hue(c) + random(-5, 5);
    float s = saturation(c) + random(-5, 5);
    float b = brightness(c) + random(-5, 5);
    return color(h, s, b);
  }
  
  public void drawRectangle()
  {
    fill(clr);
    rect(position.x, position.y, w, h);
  }
}

