
PImage forest;
PImage oscar_defeat;
PImage lautrec_wounded;
PImage lautrec_defeat;
PImage dead;
float timer = 0.0;

float preyY = 100;
float preyX = 150;
float predatorY = 30;
float predatorX = 80;
float knightX = 100;
float knightY = 250;

float easing = 0.05;

class Prey
{
  float size = 130;
  float speed = 4;
  float speed2 = 5;
  PImage img;
  PImage img4;
  
  Prey()
  {
    this.img = requestImage("lautrec.png");
    this.img4 = requestImage("lautrec_wounded.png");
  }
  
  void draw()
  {
    
    {
      image(img, preyX,preyY, this.size, this.size);
      if (timer > 10)
      {
        image(img4, preyX, preyY, this.size, this.size);
      }
    }
  }
}

class Predator
{
  float size = 210;
  float speed = 4;
  PImage img2;
  
  Predator()
  {
    this.img2 = requestImage("Sif.png");
  }
  void update()
  {
    float toX = preyX - predatorX;
    float toY = preyY - predatorY;
    if (dist(preyX, preyY, predatorX, predatorY) < 150)
    {
      predatorX = predatorX+ (toX*easing);
      predatorY = predatorY+ (toY*easing);
    }
  }
  
  void draw()
  {
    
    {
      image(img2, predatorX, predatorY, this.size, this.size);
      if (timer > 20.5)
      {
        size = 300;
      }
    }
  }
}
class knight
{
  float size = 130;
  float speed = 4;
  float speed2 = 5;
  PImage img3;
  
  knight()
  {
  this.img3 = requestImage("oscar.png");
  }
  
  void draw()
  {
    
    {
    
      image(img3, knightX, knightY, this.size, this.size);
    }
    if(timer > 40)
    {
      knightX = 100;
      knightY = 100;
    }
  }
}

Prey myprey = new Prey();
Predator mypredator = new Predator();
knight myknight = new knight();

void setup()
{
  size(500, 500);
  forest = requestImage("forest.jpg");
  oscar_defeat = requestImage("oscar_defeat.png");
  lautrec_defeat = requestImage("lautrec_defeat.jpg");
  dead = requestImage("dead.jpg");
  frameRate(30);
}

void draw()
{
  timer = timer + (1.0/30.0);
  
  image(forest, 0, 0, width, height);
  myprey.draw();
  mypredator.update();
  mypredator.draw();
  myknight.draw();
  
  preyX = preyX + myprey.speed;
  preyY = preyY + myprey.speed2;
  knightX = knightX + myknight.speed;
  knightY = knightY + myknight.speed2;
  
  if(preyX > height || preyX < 0)
  {
    myprey.speed *= -1;
  }
  if (preyY < 0 || preyY > height)
  {
    myprey.speed2 *= -1;
  }
  if (knightX > height || knightX < 0)
 {
   myknight.speed *= -1;
 } 
 if (knightY < 0 || knightY > height)
 {
   myknight.speed2 *= -1;
 }
 if (timer > 20.5)
 {
   preyY = -200;
   preyX = -200;
   image(lautrec_defeat, 300, 300, 120, 120);
 }
 if (timer > 25)
 {
   knightY = -200;
   knightX = -200;
   image(oscar_defeat, 200, 200, 120, 120);
 }
 if (timer > 28)
 {
   image(dead, 0, 0, width, height);
 }
}


