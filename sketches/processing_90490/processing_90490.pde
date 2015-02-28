
 /* @pjs preload="lizard.jpg, alligator.png"; */

PImage img;
Sprite alligator;
Sprite lizard;
PImage tractorBeamImg;

void setup() {
  img = loadImage("lizard.jpg");
  size(1000, 600);
  alligator = new Sprite(200, 200, 50, 50, 4, "alligator.png");
  lizard = new Sprite(400, 200, 50, 50, 20, "lizard.jpg");
}

void draw() {  
  // background to clear screen
  imageMode(CORNER);
  image(img, 0 ,0);
  
  // move our sprites
  alligator.move();
  lizard.move();
  
  // check collision
  boolean collided = lizard.collide(alligator);
  
  if (lizard.age > 60)
  {
    lizard.dead = true;
  }
  
  if (collided && alligator.w < 2000) // stop colliding when he gets really big
  {
    // slightly increase size of alligator while colliding
    alligator.w *= 1.01;
    alligator.h *= 1.01;
    
    // adjust x to account for CENTER coords
    float beamX = alligator.x - alligator.w / 2; 
    
    // store an image of a rectangular portion of the screen
    tractorBeamImg = get((int)beamX, (int)alligator.y + (int)alligator.w, (int)alligator.w, 200);
    
    // invert the pixels of this image
    tractorBeamImg.filter(INVERT);
    
    // draw our tracto beam image
    imageMode(CORNER);
    image(tractorBeamImg, beamX, alligator.y + alligator.w);
  } 
  
  // draw our sprites
  alligator.draw();
  lizard.draw();
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



