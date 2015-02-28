
float radius = 50;
float y = 50.0;
float x = 33;
float speed = 1.5;
 
float predatorX = 300;
float predatorY = 300;
float predatorRadius = 30;
float predatorSpeed = 2;
 
float easing = 0.05;
PImage grass; 
PImage toad;
PImage yellowToad;
class Predator
{
  float size = 80;
  float speed = 2;
  PVector position = new PVector(300, 300);
  PImage img;
   
  Predator()
  {
    this.img = requestImage("cc.png");
  }
   
  void update()
  {
    float toX = x - this.position.x;
    float toY = y - this.position.y;

       if (dist(x, y, this.position.x, this.position.y) < 100)
    {this.speed = 4; 
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
Predator mypredator2 = new Predator();
 
void setup()
{
    size(500, 500);
    noStroke();
    grass= requestImage("grass.jpg"); 
    toad= requestImage("t1.png");
    yellowToad= requestImage("t2.png");
    mypredator2.position.y = 0;
}
 
void draw()
{
  fill(0,0,0);
  image(grass,0,0,width,height);

   
  x = x + speed;
   
  if (x > height)
  {
    speed = -speed;
  }
  if (x < 0)
  {
    speed = -speed;
  }
   

  float waveSpeed = 0.5;
  float waveHeight = 10.0;
  y = 33 + sin(x * waveSpeed) * waveHeight;
  image(toad,x, y, 40, radius);
   
  mypredator.update();
  mypredator.draw();
   
  mypredator2.update();
  mypredator2.draw();
}



