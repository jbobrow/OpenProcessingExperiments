
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/91429*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* @pjs preload="oldman.png, nurse.png"; */
 
PImage img;
Sprite nurse;
Sprite oldman;
Sprite pill;
PImage tractorBeamImg;
 
void setup() {
  img = loadImage("hospitalroom.jpg");
  size(350, 230);
  nurse = new Sprite(200, 200, 50, 50, 4, "nurse.png");
  oldman = new Sprite(350, 200, 50, 50, 20, "oldman.png");
  pill = new Sprite(100, 100, 50, 50, 10, "pill.png");
  
}
 
void draw() { 
  // background to clear screen
  imageMode(CORNER);
  image(img, 0 ,0);
   
  // move our sprites
  nurse.move();
  oldman.move();
  pill.move();
  
   
  // check collision
  boolean collided = oldman.collide(nurse);
   
  if (oldman.age > 60)
  {
    oldman.dead = true;
  }
   
  if (collided && nurse.w < 2000) // stop colliding when he gets really big
  {
    // slightly increase size of nurse while colliding
    nurse.w *= 1.01;
    nurse.h *= 1.01;
  }
   
  // draw our sprites
  nurse.draw();
  oldman.draw();
  pill.draw();
  
}
 
class Sprite
{
  float x;
  float y;
  float speed;
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
    speed = sspeed;
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
        speed = -speed;
      }
           
      x += speed;
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




