
Ball b;
float gravity = 0.98;
ArrayList l;
PImage smoke;
float wind;

void setup()
{
  size(640,480);
  frameRate(60);
  background(0);
  imageMode(CENTER);
  PImage msk = loadImage("texture.gif");
  smoke = new PImage(msk.width,msk.height);
  for (int i = 0; i < smoke.pixels.length; i++) smoke.pixels[i] = color(255);
  smoke.mask(msk);
 
  b = new Ball(width>>1,15,8,0);
  fill(0xFF00FF00);
  l = new ArrayList();
}

void draw()
{
  wind = map(mouseX,0,width-1,-3,3);
  background(0);
 
  for (int i = 0; i < l.size(); i++)
  {
    Weed w = (Weed) l.get(i);
    w.update();
    w.draw();
  }
  int i = 0;
 
  while(i < l.size())
  {
    Weed w = (Weed)l.get(i);
    if (w.alive)
    {
      i++;
    }
    else
    {
      l.remove(i);
    }
  }
 
  b.update();
  stroke(255);
  if (mousePressed)
  {
    line(x,y,mouseX,mouseY);
  }
  stroke(0);
  b.draw();
}

int x, y;

void mousePressed()
{
  x = mouseX;
  y = mouseY;
}

void mouseReleased()
{
  b = new Ball(x,y,(mouseX - x) / 5, (mouseY - y) / 5);
}

class Ball
{
  float x, y;
  float dx, dy;

  float px, py;
  float rotation;
 
  static final float COR = 0.99;
 
  Ball(float x, float y, float dx, float dy)
  {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
  }

  void draw()
  {
    ellipse(x,y,30,30);
  }

  void update()
  {
    px = x;
    py = y;
   
    dy += gravity;
    y += dy;
    if (y >= height - 15)
    {
      dy = (-dy) * 0.8;
      y = height - 15;
    }

    x += dx;
    if (y == height - 15)
      dx *= COR;
     
    if ((x < 15) || (x >= width - 15))
    {
      dx = -dx * COR;
      x = (x < 15)?15:width-15;
    }
   
    float xDiff = x-px;
    float yDiff = y-py;
    float distance = sqrt(pow(abs(xDiff),2)+pow(abs(yDiff),2));
    int particles = (int)(distance / 6);
   
    float xInc = xDiff / particles;
    float yInc = yDiff / particles;
   
    for (int i = 0; i < particles; i++)
    {
      l.add(new Weed(px + (xInc * i),py + (yInc * i)));
    }
   
    l.add(new Weed(x,y));
  }
}

class Weed
{
  static final float GRAVITY=-3;
  float x,y,dX;
  boolean alive = true;
  int life;
  color colour;
 
  Weed(float x, float y)
  {
    this.x=x;
    this.y=y;
    life = 255;
    this.dX = random(3.)-1.5;
    colour = color(random(255),random(255),random(255));
  }
 
  void update()
  {
    y += GRAVITY;
    x += dX + wind;
   
    if (life > 1)
      life-=2;
    else
      alive = false;
     
    if ((x < -30) || (x > width + 30) || (y < -30)) alive = false;
  }
 
  void draw()
  {
    pushStyle();
    noStroke();
    tint(colour, life);
    image(smoke,x,y);
    popStyle();
  }
}

