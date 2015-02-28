
PImage Woods;
float y = 50;
float x = 450;
float speed = .5;
float dirX= 1;
float dirY= 1;
PImage LadyBug;
float timer= 0.0;
float easing = 0.05;
  
class Predator
{
  float size = 40;
  float speed = .5;
  PVector position = new PVector(500, 500);
  PImage img;
    
  Predator()
  {
    this.img = requestImage("GiantSpider.png");
  }
    
  void update()
  {
    float toX = x - this.position.x;
    float toY = y - this.position.y;
    if (dist(x, y, this.position.x, this.position.y) < 100)
    {
      this.speed = 4;
    }
    if (dist(x, y, this.position.x, this.position.y) < 100)
    {
      this.speed = 4;
    }
    
    PVector direction = new PVector(toX , toY);
    direction.normalize();
    this.position.x += direction.x * this.speed;
    this.position.y += direction.y * this.speed;
  }
    
  void draw()
  {
    if (img.width > 0 && dist(x, y, this.position.x, this.position.y) > 20)
    {
      image(img, this.position.x, this.position.y, this.size, this.size);
    }
  }
}
  
Predator mypredator = new Predator();

class Fly
{
  float flySize = 40;
  float flySpeed = 2;
  PVector flyPosition = new PVector(0, 0);
  PImage theFly;
    
  Fly()
  {
    theFly = requestImage("Fly.png");
  }
    
  void update()
  {
    float flySize = 40;
    float flySpeed = 1;
    float FtoX = x- flyPosition.x;
    float FtoY = y - flyPosition.y;
    if (dist(x, y, flyPosition.x, flyPosition.y) < 100)
    {
      flySpeed = 4;
    }
    if (dist(x, y, flyPosition.x, flyPosition.y) < 100)
    {
      flySpeed = 4;
    }
    PVector flyDirection = new PVector(FtoX , FtoY);
    flyDirection.normalize();
    flyPosition.x += flyDirection.x * flySpeed;
    flyPosition.y += flyDirection.y * flySpeed;
  }
    
  void draw()
  {
    timer = timer + (1.0/30.0);
    if (timer > 10);
    {
      flySpeed = 0;
    }
    if (theFly.width > 0 && dist(x, y, flyPosition.x, flyPosition.y) > 20)
    {
      image(theFly, flyPosition.x, flyPosition.y, flySize, flySize);
    }
  }
}

Fly myFly = new Fly();

void setup()
{
    size(500, 500);
    Woods = requestImage("Woods.jpg");
    LadyBug = requestImage("LadyBug.png");
    noStroke();    
}
 
void draw()
{
  timer= timer + (1.0/30.0);
  float waveSpeed = .1;
  float waveHeight = 20;
  image(Woods,0,0,width,height);
  pushMatrix();
  image(LadyBug,x,y,40,40);
  x = x - (speed * dirX);
  y = y + (speed * dirY);
 if (timer > 20)
  {
    speed = 0;
  }
  if (x > width)
  {
    dirX = -dirX;
  }
  if (x < 0)
  {
    dirX = -dirX;
  }
  if (y > height)
  {
    dirY = -dirY;
  }
  if (y < 0)
  {
    dirY = -dirY;
  }
  if (x > width)
  {
    speed = -speed;
  }
  if (x < 0)
  {
    speed = -speed;
  }
  popMatrix();
    
  mypredator.update();
  mypredator.draw();
  myFly.update();
  myFly.draw();
}



