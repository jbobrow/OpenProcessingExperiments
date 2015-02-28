
PImage bird;
PImage cat;
PImage house;
PImage blood;
PImage grave;

float x;
float y;
float timer = 0.0;
float lifetimer = 10.0;
float ambush = 5.0;

float birdx = 0;
float birdy = 150;
float bspeed = 1.5;

float catx = 150;
float caty = 0;
float meowx = 100;
float meowy = 250;
float cspeedx = 2;
float cspeedy = 2;

float predatorX = -450;
float predatorY = -250;
float bloodX = 100;
float bloodY = 250;
float predatorSpeed = 1;
float easing = 0.05;

class Predator
{
  float size = 120;
  float speed = 1.5;
  PVector position = new PVector(-450, 50);
  PImage img;
  float targetX;
  float targetY;
  
  Predator()
  {
    this.img = requestImage("Dog.png");
  }
  
  void update()
  {
    float toCX = meowx - this.position.x;
    float toCY = meowy - this.position.y;
    
    if (dist(meowx, meowy, this.position.x, this.position.y) <= 700)
    {
      this.position.x += (toCX * easing);
      this.position.y += (toCY * easing);
    }
  }
  void draw()
  {
    if (img.width > 0 && dist(meowx, meowy, this.position.x, this.position.y) > 0)
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
  blood = requestImage("Blood.png");
  grave = requestImage("Grave.png");
}

void draw()
{
  imageMode(CENTER);
  image(house, 250, 250, width, height);
  timer = timer + (1.0 / 30.0);
  lifetimer = lifetimer - (1.0 / 60.0);
  ambush = ambush - (1.0 / 30.0);
  
  if (ambush <= 0)
  {
    mypredator.position.x = 2000;
    mypredator.position.y = 2000;
    image (blood, bloodX, bloodY, 100, 100);
  }
  
  if (bird.width > 0)
  {
    pushMatrix();
    translate(width/2, height/2);
    imageMode(CENTER);
    rotate(radians(timer * 100));
    image(bird, birdx, birdy, 90, 90);
    popMatrix();
    
    if (lifetimer <= 0)
    {
      birdx = 5000;
      birdy = 5000;
      image(grave, 300, 150, 100, 100);
    }
  }
  
  if (cat.width > 0)
  {
    pushMatrix();
    translate(width/2, height/2);
    imageMode(CENTER);
    rotate(radians(timer * 100));
    image (cat, catx, caty, 100, 100);
    popMatrix();
    
    if (ambush < 0)
    {
      catx = 5000;
      caty = 5000;
      image (blood, meowx, meowy, 100, 100);
    }
  }
  
  float distanceToPrey1 = dist(mypredator.position.x, mypredator.position.y, meowx, meowy);
  mypredator.targetX = meowx;
  mypredator.targetY = meowy;
  mypredator.update();
  mypredator.draw();
}


