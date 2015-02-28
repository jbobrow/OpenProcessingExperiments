
/* @pjs preload="cheese.png, mouse.png, floor.jpg, cat.png, oldcheese.png"; */
 
PImage img;
Sprite mouse;
Sprite cheese;
Sprite oldcheese;
Sprite cat;
 
void setup() {
  img = loadImage("floor.jpg");
  size(700, 600);
  mouse = new Sprite(200, 200, 50, 50, random(15), "mouse.png");
  cheese = new Sprite(400, 200, 50, 50, random(20)+10, "cheese.png");
  oldcheese = new Sprite(cheese.x, cheese.y, 50, 50, 10, "oldcheese.png");
  cat = new Sprite(300, 200, 150, 150, random(10), "cat.png");
}

 
class Sprite
{
  float x;
  float y;
  float speedX;
  float speedY;
  PImage img;
  float w;
  float h;
  boolean dead;
  float age;
   
  // constructor that we call when we do new Sprite(...   assign our variables to what we pass in
  Sprite(float xx, float yy, float ww, float hh, float sspeed, String imageName)
  {
    x = xx;
    y = yy;
    speedX = sspeed;
    speedY = sspeed;
    img = loadImage(imageName);
    w = ww;
    h = hh;
    dead = false;
    age = 0;
  }
   
  void draw()
  {
    if (!dead)
    {
      imageMode(CENTER);
      image(img, x, y, w, h);
    }
  }
   
  void move()
  {
    if (!dead)
    {
      age += 0.167;
         
      if (x >= width || x <= 0)
      {
        speedX = -speedX;
      } 
      x += speedX;
      if (y >= height || y <= 0)
      {
        speedY = -speedY;
      }
      y += speedY;
    }
  }
   
  boolean collide(Sprite other)
  {
    if (!dead)
    {
      float d = dist(x, y, other.x, other.y);
      float maxWidth = max(w, other.w);
         
      if (d < maxWidth)
      {
        return true;
      }
    }
       
    return false;
  }
}

void draw() { 
  // background to clear screen
  imageMode(CORNER);
  image(img, 0 ,0);
   
  // move our sprites
  mouse.move();
  cheese.move();
  oldcheese.move();
  cat.move();
   
  // check collision
  boolean collided = cheese.collide(mouse);
   
  if (cheese.age > 50)
  {
    cheese.dead = true;
  }
  
  if (cheese.age >= 50 && cheese.age <= 100){
    oldcheese.draw();
    
    
  }
   
  if (collided && mouse.w < 2000) // stop colliding when he gets really big
  {
    // slightly increase size of mouse while colliding
    mouse.w *= 1.04;
    mouse.h *= 1.04;
  }
   
  // draw our sprites
  mouse.draw();
  cheese.draw();
  cat.draw();
}


