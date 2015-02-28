
PImage bird;
PImage cat;
PImage house;

float x;
float y;

float birdx = 33;
float birdy = 50.0;
float bspeed = 1.5;

float catx = 0;
float caty = 0;
float cspeedx = 2;
float cspeedy = 2;

float predatorX = 100;
float predatorY = 100;
float predatorSpeed = 1;
float easing = 0.05;

class Predator
{
  float size = 120;
  float speed = 2;
  PVector position = new PVector(300, 300);
  PImage img;
  float targetX;
  float targetY;
  
  Predator()
  {
    this.img = requestImage("Dog.png");
  }
  
  void update()
  {
    float toBX = birdx - this.position.x;
    float toBY = birdy - this.position.y;
    float toCX = catx - this.position.x;
    float toCY = caty - this.position.y;
    
    if (dist(birdx, birdy, this.position.x, this.position.y) < 200)
    {
      this.position.x += (toBX * easing);
      this.position.y += (toBY * easing);
    }
    if (dist(catx, caty, this.position.x, this.position.y) < 200)
    {
      this.position.x += (toCX * easing);
      this.position.y += (toCY * easing);
    }
  }
  void draw()
  {
    if (img.width > 0 && dist(birdx, birdy, this.position.x, this.position.y) > 20)
    {
      image(img, this.position.x, this.position.y, this.size, this.size);
    }
    if (img.width > 0 && dist(catx, caty, this.position.x, this.position.y) > 20)
    {
      image(img, this.position.x, this.position.y, this.size, this.size);
    }
  }
}

Predator mypredator = new Predator();

void setup()
{
  size(500, 500);
  bird = requestImage("Bird.png");
  cat = requestImage("Cat.png");
  house = requestImage("House.jpg");
}

void draw()
{
  imageMode(CENTER);
  image(house, 250, 250, width, height);
  
  birdx = birdx + bspeed;
  if (birdx > width)
  {
    bspeed = -bspeed;
  }
  if (birdx < 0)
  {
    bspeed = -bspeed;
  }
  
  float waveSpeed = 0.5;
  float waveHeight = 7;
  birdy = 33 + sin(birdx * waveSpeed) * waveHeight;
  image(bird, birdx, birdy, 100, 100);
  
  catx = catx + cspeedx;
  caty = caty + cspeedy;
  if (catx > width)
  {
    cspeedx = -cspeedx;
  }
  if (catx < 0)
  {
    cspeedx = -cspeedx;
  }
  if (caty > height)
  {
    cspeedy = -cspeedy;
  }
  if (caty < 0)
  {
    cspeedy = -cspeedy;
  }
  image (cat, catx, caty, 100, 100);
  
  float distanceToPrey1 = dist(mypredator.position.x, mypredator.position.y, x, y);
  float distanceToPrey2 = dist(mypredator.position.x, mypredator.position.y, mypredator.position.x, mypredator.position.y);
  mypredator.targetX = x;
  mypredator.targetY = y;
  mypredator.update();
  mypredator.draw();
}


