

 
PImage img;
Sprite hunter;
Sprite human;
Sprite boomer;
Sprite random;
PImage tractorBeamImg;

float hunterX;
float hunterY;
float maxSpeed = 3.0;



 
void setup() {
  img = loadImage("background.jpg");
  size(1000, 550);
  hunter = new Sprite(200, 200, 100, 100, 4, "hunter.jpg");
  human = new Sprite(200, 200, 100, 100, 10, "human.jpg");
  boomer = new Sprite(200, 400, 50, 50, 1, "boomer.jpg");
  random = new Sprite(200, 400, 1, 1, 100, "random.jpg");
}
 
void draw() { 
  // background to clear screen
  imageMode(CORNER);
  image(img, 0 ,0);
   
  // move sprites
  hunter.move();
  human.move();
  boomer.move();
  random.move();
  
  
   
  // Hunter collision
  boolean collided = human.collide(hunter);
   
  if (human.age > 60)
  {
    human.dead = true;
  }
   
  if (collided && hunter.w < 2000) // stop colliding when he gets really big
  {
    // slightly increase size of hunter while colliding
    hunter.w *= 1.01;
    hunter.h *= 1.01;
     
    // adjust x to account for CENTER coords
    float beamX = hunter.x - hunter.w / 2;
     
    // store an image of a rectangular portion of the screen
    tractorBeamImg = get((int)beamX, (int)hunter.y + (int)hunter.w, (int)hunter.w, 200);
     
    // invert the pixels of this image
    tractorBeamImg.filter(INVERT);
     
    // draw our tracto beam image
    imageMode(CORNER);
    image(tractorBeamImg, beamX, hunter.y + hunter.w);
  }
  
  // Boomer Collision
  boolean collision = random.collide(boomer);
   
  if (boomer.age > 60)
  {
    boomer.dead = true;
  }
   
  if (collision && boomer.w < 2000) // stop colliding when he gets really big
  {
    // slightly increase size of boomer while colliding
    boomer.w *= 1.02;
    boomer.h *= 1.02;
     
    // adjust x to account for CENTER coords
    float beamX = boomer.x - boomer.w / 2;
     
    // store an image of a rectangular portion of the screen
    tractorBeamImg = get((int)beamX, (int)boomer.y + (int)boomer.w, (int)boomer.w, 200);
     
    // invert the pixels of this image
    tractorBeamImg.filter(INVERT);
     
    // draw our tracto beam image
    imageMode(CORNER);
    image(tractorBeamImg, beamX, hunter.y + hunter.w);
  }
   
  // draw our sprites
  hunter.draw();
  human.draw();
  boomer.draw();
  random.draw();
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
  
    boolean collision(Sprite other)
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



