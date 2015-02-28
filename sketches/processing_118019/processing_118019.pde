
SpriteObject Acorn;
Predator squirl;

void setup()
{
 size(500, 500);
 
 Acorn = new SpriteObject("Acorn.png");
 Acorn.y = 300;
 Acorn.x = 200;
 Acorn.directionX = 1;
 Acorn.directionY = 1.2;
 Acorn.speed = 3; 
 Acorn.s = .5;
 
 squirl = new Predator("squirl.jpg");
 squirl.y = 300;
 squirl.x = 200;
 squirl.s = .08;
}

void draw()
{
   background(0);
  
 Acorn.render(); 
 Acorn.update();
 
 squirl.render();
 squirl.update();
}

class Predator extends SpriteObject
{
  float c = 0.05;
  Predator(String filename) { super(filename); }

  void update()
  {
    
    float targetX = Acorn.x;
    float dx = targetX - this.x;
    if(abs(dx) > 1)
    {
      this.x += dx * this.c;
    }
    
    float targetY = Acorn.y;
    float dy = targetY - this.y;
    if(abs(dy) > 1)
    {
      this.y += dy * this.c;
    }
  }
}


class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float directionX;
  float directionY;
  float speed;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
  
  void update()
  {
    //right
    if(this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      this.speed = this.speed * 2;
    }
    //left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      this.speed = this.speed * .5;
    }
     
    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.s = this.s * .5;
    }
     
    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.s = this.s * 2;
    }
     
    // Move the sprite
    this.y += directionY * speed;
    this.x += directionX * speed;
    
    float waveSpeed = 4;
    float waveHeight = 4;
    float angle = this.x * waveSpeed;
    float offset = sin(radians(angle)) * waveHeight;
    this.y += offset;
  }

   
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
     
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}



