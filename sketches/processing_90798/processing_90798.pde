
PImage backgroundImage;
Sprite tomSprite;
Sprite jerrySprite;
Sprite spikeSprite;


 
void setup() {
  backgroundImage = loadImage("backyard.jpg");
  size(1000, 600);
  tomSprite = new Sprite(random(600), random(100, 400), 70, 70, 20, "tom.png");
  jerrySprite = new Sprite(random(600), 200, 60, 60, 20, "jerry.png");
  spikeSprite = new Sprite(random(600), random(100, 400), 100, 100, 4, "spike.png");
                          // xPos, yPos, width, height, speed, sprite image source
}
 
void draw() { 
  // background to clear screen
  imageMode(CORNER);
  image(backgroundImage, 0 ,0, width, height);
   
  // move our sprites
  tomSprite.move();
  jerrySprite.move();
  spikeSprite.move();
   
  // check collision
  boolean collided = tomSprite.collide(jerrySprite);
 
   
  if (collided && tomSprite.w < 100) // stop collision event when tom gets bigger than 100 pixels
  {
    // slightly increase size of tom while colliding
    tomSprite.w *= 1.3;  //original was 1.01, change to 1.09
    tomSprite.h *= 1.3;
    
    jerrySprite.w *= 0; //decreases size of jerry so that he disappears.
    jerrySprite.w *= 0;  
    
  }
   
  // draw our sprites
  tomSprite.draw();
  jerrySprite.draw();
  spikeSprite.draw();
}
 
class Sprite
{
  float x;
  float y;
  float speed;
  PImage img;
  float w;
  float h;
  float age;
  boolean dead;
   
  // constructor that we call when we do new Sprite(...   assign our variables to what we pass in
  Sprite(float xx, float yy, float ww, float hh, float sspeed, String imageName)
  {
    x = xx;
    y = yy;
    speed = sspeed;
    img = loadImage(imageName);
    w = ww;
    h = hh;
    age = 0;
    dead = false;
  }
   
  void draw()
  {
     
    imageMode(CENTER);
    image(img, x, y, w, h);
    
  }
   
  void move()
  {
    age += 0.01;
    
    if (age > 100)
    {
        dead = true;
    }
    
    
    if (!dead)
    {
        if (x >= width || x <= 0)
        {
            speed = -speed;
        }
        
        x += speed;
    }
      
      
    
  }
   
  boolean collide(Sprite other)
  {
    float d = dist(x, y, other.x, other.y);
    float maxWidth = max(w, other.w);
     
    if (d < maxWidth)
      return true;
       
    return false;
  }
}


