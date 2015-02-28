
class Predator extends SpriteObject
{
  float targetX;
  float targetY;
  float easing = 0.05;
  
  Predator(String filename)
  {
    super(filename);
  }
  
  void update()
  {
  float dx = targetX - x;
  if(abs(dx) > 1)
  {
    x += dx * easing;
  }
  float dy = targetY - y;
  if(abs(dx) > 1)
  {
    y += dy * easing;
  }
  }
}

SpriteObject likePlz;
Predator nomPlz;

void setup()
{
  size(500,500);
  likePlz = new SpriteObject("ilikeitplz.png");
  likePlz.y = 200;
  likePlz.speed = 2;
  likePlz.s = 1.2;
  likePlz.directionX = 1;
  likePlz.directionY = 1;
  
  nomPlz = new Predator("inomitplz.png");
  nomPlz.speed = 2;
  nomPlz.s = 1.8;
}

void draw()
{
  background(0);
  likePlz.update();
  likePlz.render();
  
  nomPlz.targetX = likePlz.x;
  nomPlz.targetY = likePlz.y;
  
  nomPlz.update();
  nomPlz.render();
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 1.0;
  float angle = 0;
  
  PImage img;
  boolean loaded = false;
     
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
  
  void update()
  {
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0) //right
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      this.speed += 5;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0) //left
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      this.speed -= 5;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0) //bottom
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.s = 1;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0) //top
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.s = 3;
    }
     
    this.y += directionY * random(18) * speed;
    this.x += directionX * random(18) * speed;
    //float angle = radians(x/2);
    //this.x += 5;
    //this.y = 100 + sin(angle)*100;
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


