
float timer = 0;
SpriteObject prey;
SpriteObject deadPrey;
Predator alpha;
PImage home;
SpriteObject birdy;

void setup()
{
  size(700,700);
  home = requestImage("interior.jpg");
  prey = new SpriteObject("small_mouse.jpg");
  prey.y = 150;
  prey.speed = 2;
  prey.directionX = 1;
  prey.directionY = 1;
  deadPrey = new SpriteObject("small_mouse_dead.jpg");
  alpha = new Predator("small_cat.jpg");
  birdy = new SpriteObject("tiny_bird.jpg");
  birdy.x = 550;
  birdy.speed = 5;
  birdy.directionX = 1;
  birdy.directionY = 1;
}

void draw()
{
  if(home.width > 0)
  {
   image(home, 0, 0, width*2, height*2);
  }
  
  timer += 0.0167;
  
  prey.update();
  prey.render();
  
  alpha.update();
  alpha.render();
  
  if (timer > 6 && alpha.isOverlapping(prey) == true)
    {
      prey.speed = 0;
      prey.img = deadPrey.img;
      alpha.s = 2.0;
    }
   if(timer > 6)
   {
    birdy.update();
    birdy.render();
     
    alpha.update2();
    alpha.render();
   }
}

class Predator extends SpriteObject
{
  float targetX;
  float targetY;
  color newColor;
  float easing = 0.02;

  Predator(String filename)
  {
    super(filename);
  }
  
  /*void render()
  {
    fill(this.newColor);
    rect(this.x, this.y, this.w, this,h);
  }*/
  
  void update()
  {
    alpha.targetX = prey.x;
    float dx = targetX - x;
    if(abs(dx) > 1) 
    {
      x += dx * easing;
    }
    alpha.targetY = prey.y;
    float dy = targetY - y;
    if(abs(dy) > 1) 
    {
      y += dy * easing;
    }
  }
  
  void update2()
  {
    alpha.targetX = birdy.x;
    float dx = targetX - x;
    if(abs(dx) > 1) 
    {
      x += dx * easing;
    }
    alpha.targetY = birdy.y;
    float dy = targetY - y;
    if(abs(dy) > 1) 
    {
      y += dy * easing;
    }
  }
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
  PImage img;
  boolean loaded = false;
   
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
  
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - ( this.w * 0.5 * this.s);
    float right = this.x + ( this.w * 0.5 * this.s);
    float top = this.y - ( this.h * 0.5 * this.s);
    float bottom = this.y + ( this.h * 0.5 * this.s);
    
    float otherLeft = other.x - ( other.w * 0.5 * other.s);
    float otherRight = other.x + ( other.w * 0.5 * other.s);
    float otherTop = other.y - ( other.h * 0.5 * other.s);
    float otherBottom = other.y + ( other.h * 0.5 * other.s);
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
  
  void update()
  {
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      //this.speed += 2;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      //this.speed -= 2;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      //this.s = 0.5;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      //this.s = 2;
    }
     
    this.y += directionY * speed * random(0.1, 5);
    this.x += directionX * speed * random(0, 5);
    
     
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



