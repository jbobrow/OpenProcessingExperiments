
/* @pjs preload="peasant.gif, vampire.jpg, hunter.jpeg"; */
  
PImage img;
Sprite vampire;
Sprite peasant;
Sprite hunter;
PImage tractorBeamImg;
  
void setup() {
  img = loadImage("town.jpg");
  size(500, 333);
  vampire = new Sprite(200, 200, 50, 50, 4, "vampire.jpg");
  peasant = new Sprite(350, 200, 50, 50, 20, "peasant.gif");
  hunter= new Sprite (500,200,50,50,4,"hunter.jpeg");
}
  
void draw() {
  // background to clear screen
  imageMode(CORNER);
  image(img, 0 ,0);
    
  // move our sprites
  vampire.move();
  peasant.move();
  hunter.move();
    
  // check collision
  boolean collided = peasant.collide(vampire);
    
  if (peasant.age > 60)
  {
    peasant.dead = true;
  }
    
  if (collided && vampire.w < 2000) // stop colliding when he gets really big
  {
    // slightly increase size of vampire while colliding
    vampire.w *= 1.01;
    vampire.h *= 1.01;
  }
   boolean Hcollided = hunter.collide(vampire);
   if (Hcollided && vampire.w<4000 ) // stop colliding when he gets really big
  {
    // slightly decreases size of vampire while colliding
    vampire.w -= 1.01;
    vampire.h -= 1.01;
  }
    
  // draw our sprites
  vampire.draw();
  peasant.draw();
  hunter.draw();
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



