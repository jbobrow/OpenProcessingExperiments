
Insect web;
Insect spider;
Insect fly;
Insect bug;
Insect squish;
float counter = 0;


void setup()
{
  size(500, 500);
  web = new Insect("web.jpg");
  web.s = .5;
  web.x = width/2;
  web.y = height/2;
  
  spider = new Insect("spider.png");
  spider.speed = 1;
  spider.s = .1;
  spider.dY = .5;
  spider.dX = 1;
  spider.x = 0;
  spider.y = 0;
  
  fly = new Insect("fly.png");
  fly.speed = 1;
  fly.s = .1;
  fly.x = random(500);
  fly.y = random(500);
  fly.dY = random(2);
  fly.dX = random(2);
  
  bug = new Insect("bug.png");
  bug.speed = 1;
  bug.s = .2;
  bug.dY = -1;
  bug.dX = 1;
  bug.x = random(500);
  bug.y = random(500);
    
  squish = new Insect("squish.png");
  squish.s = .4;
  
}

void draw()
{
  counter += 0.01;  
  if (spider.eat(fly) == true)
  {
    fly.s = 0;
    spider.s = .15;
  }
  
  web.create();
  spider.create();
  spider.move(); 
  fly.create();
  fly.move();
  bug.create();
  bug.move();
 
  
  if (counter > 12)
  {
    bug.speed = 0;
    squish.x = bug.x;
    squish.y = bug.y;
    squish.create();
  }
  
}

class Insect
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float r = 0.0;
  float speed;
  float dX;
  float dY;
  float s = 1.0;
  PImage pic;
  boolean loaded = false;
     
  Insect(String fname)
  {
    pic = requestImage(fname);
  }
  
    void create()
  {
    if (pic.width > 0 && loaded == false)
    {
      loaded = true;
      if (w == -1.0)
      {
        w = pic.width;
      }
      if (h == -1.0)
      {
        h = pic.height;
      }
    }
       
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(x, y);
      rotate(radians(r));
      scale(s);
      image(pic, 0, 0, w, h);
      popMatrix();
    }
  }
  
  void move()
  {
    if (x > width - (w * s * 0.4) && dX > 0)
    {
      x = width - (w * s * 0.4);
      dX = -dX;
    }
    if (x < (w * s * 0.2) && dX <= 0)
    {
      x = (w * s * 0.2);
      dX = -dX;
    }
    if (y > height - (h * s * 0.4) && dY > 0)
    {
      y = height - (h * s * 0.4);
      dY = -dY;
    }
    if (y < (h * s * 0.3) && dY <= 0)
    {
      y = (h * s * 0.3);
      dY = -dY;
    }
      
    y += dY * speed;
    x += dX * speed;
  }
  
    boolean eat(Insect fly)
  {
    float left = x - (w * 0.5 * s);
    float right = x + (w * 0.5 * s);
    float top = y - (h * 0.5 * s);
    float bottom = y + (h * 0.5 * s);  
    float flyLeft = fly.x - (fly.w * 0.5 * fly.s);
    float flyRight = fly.x + (fly.w * 0.5 * fly.s);
    float flyTop = fly.y - (fly.h * 0.5 * fly.s);
    float flyBottom = fly.y + (fly.h * 0.5 * fly.s); 
   
    return !(flyRight<left || flyLeft>right || flyBottom<top || flyTop>bottom);
  }
 
}


