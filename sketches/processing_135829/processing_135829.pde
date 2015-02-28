
PImage forest;
PImage deadbird;
PImage deadbird2;
float timer = 0.0;
 
float preyY = 100;
float preyX = 150;
float predatorY = 30;
float predatorX= 80;
float birdX = 100;
float birdY = 250;
 
float easing = 0.05;

class Prey
{
  float size = 90;
  float speed = 4;
  float speed2 = 5;
  PImage img;
   
  Prey()
  {
    this.img= requestImage("bird.png");
  }
  void draw()
  {
    if (img.width == 0) 
    {
      // Image is not yet loaded
    } 
    else if (img.width == -1) 
    {
      // This means an error occurred during image loading
    } 
    else 
    {
    image(img,preyX,preyY,this.size,this.size);
    }
  }
}
class Predator
{
  float size = 110;
  float speed = 4;
  PImage img2;
   
  Predator()
  {
    this.img2= requestImage("tiger.png");
  }
  void update()
  {
    float toX = preyX - predatorX;
    float toY = preyY - predatorY; 
    if (dist(preyX,preyY,predatorX,predatorY) < 120)
    {
      predatorX = predatorX+ (toX*easing);
      predatorY = predatorY+ (toY*easing);
    }
  }
  void draw()
  {
    if (img2.width == 0) 
    {
      // Image is not yet loaded
    } 
    else if (img2.width == -1) 
    {
      // This means an error occurred during image loading
    } 
    else 
    {
    image(img2,predatorX,predatorY,this.size,this.size);
    }
  }
}
class Bird
{
  float size = 80;
  float speed = 4;
  float speed2 = 5;
  PImage img3;
   
  Bird()
  {
    this.img3= requestImage("birdmd.png");
  }
  void draw()
  {
    if (img3.width == 0) 
    {
      // Image is not yet loaded
    } 
    else if (img3.width == -1) 
    {
      // This means an error occurred during image loading
    } 
    else 
    {
      // Image is ready to go, draw it
      image(img3,birdX,birdY,this.size,this.size);
    }
    if(timer > 40)
    {
      birdX = 100;
      birdY = 100;
    }
  }
}
 
Prey myprey = new Prey();
Predator mypredator = new Predator();
Bird mybird = new Bird();
 
void setup()
{
  size(500,500);
  forest = requestImage("forest-light-900.jpg");
  deadbird = requestImage("bird2.png");
  deadbird2 = requestImage("birdmd1.png");
  frameRate(30); 
}
void draw()
{
  timer = timer + (1.0 / 30.0);
  
  image(forest,0,0,width,height);
  myprey.draw();
  mypredator.update();
  mypredator.draw();
  mybird.draw();
   
  preyX = preyX + myprey.speed;
  preyY = preyY + myprey.speed2;
  birdX = birdX + mybird.speed;
  birdY = birdY + mybird.speed2;
  
  if(preyX > height || preyX < 0)
  {
    myprey.speed *= -1;
  }
  if (preyY < 0 || preyY > height)
  {
    myprey.speed2 *= -1;
  }
  if(birdX > height || birdX < 0)
  {
    mybird.speed *= -1;
  }
  if (birdY < 0 || birdY > height)
  {
    mybird.speed2 *= -1;
  }
  if (timer>20.5)
  {
    preyY = -200;
    preyX = -200;
    image(deadbird,300,300,80,80);
  }
  if(timer > 40)
  {
    birdY = -200;
    birdX = -200;
  image(deadbird2,200,200,80,80);
  }
}
 



