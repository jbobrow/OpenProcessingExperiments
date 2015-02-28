
float radius = 20;
float y = 250;
float x = 250;
float speed = 1;
float prey2 = 0;
float x2 = 25;
float y2 = 40;
float prey2WH = 40;
float predatorX = 300;
float predatorY = 300;
float predatorRadius = 40;
float predatorSpeed = .5;
float dirX= 1;
float dirY= 1;
 
float easing = 0.05;
 
class Predator
{
  float size = 40;
  float speed = .5;
  PVector position = new PVector(500, 500);
  PImage img;
   
  Predator()
  {
    this.img = requestImage("PREDATORPromo.png");
  }
   
  void update()
  {
    float toX = x - this.position.x;
    float toY = y - this.position.y;
    if (dist(x, y, this.position.x, this.position.y) < 100)
    {
      this.speed = 4;
    }
    if (dist(x2, y2, this.position.x, this.position.y) < 100)
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
 
void setup()
{
    size(500, 500);
    noStroke();
     
}
 
void draw()
{
  fill(0,0,0, 20);
  rect(0,0,width,height);
  fill(255,184,242);
  rect(x2,y2,prey2WH,prey2WH);
  x = x + speed;
  x2 = x2 + (speed * dirX);
  y2 = y2 + (speed * dirY);
  if (x2 > width)
  {
    dirX = -dirX;
  }
  if (x2 < 0)
  {
    dirX = -dirX;
  }
  if (y2 > height)
  {
    dirY = -dirY;
  }
  if (y2 < 0)
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
   
  fill(255);
  float y = 250 + random(-5,5);
  ellipse(x, y, radius, radius);
   
  mypredator.update();
  mypredator.draw();
}



