
class HotRod extends Car
{
  HotRod()
  {
    super();
    this.carColor = color(255, 255, 0);
  }
   
  void NOS()
  {
    this.speed += 0.5;
  }
}
 
class Car
{
  float x;
  float y;
  float directionX = 0;
  float directionY = 1;
  float w = 50;
  float h = 100;
  float speed;
  color carColor;
   
  Car()
  {
    this.speed = 1;
    this.carColor = color(0, 255, 0);
  }
   
  void stop()
  {
    this.speed = 0;
  }
   
  void go(float s)
  {
    this.speed = s;
  }
   
  void drive()
  {
    if (this.x > width - this.w && this.directionX > 0)
    {
      this.x = width - this.w;
      this.directionX = -this.directionX;
    }
    if (this.x < 0 && this.directionX <= 0)
    {
      this.x = 0;
      this.directionX = -this.directionX;
    }
    if (this.y > height - this.h && this.directionY > 0)
    {
      this.y = height - this.h;
      this.directionY = -this.directionY;
    }
    if (this.y < 0 && this.directionY <= 0)
    {
      this.y = 0;
      this.directionY = -this.directionY;
    }
     
    this.y += directionY * speed;
    this.x += directionX * speed;
  }
   
  void render()
  {
    fill(this.carColor);
    rect(this.x, this.y, this.w, this.h);
  }
}
 
Car redCar;
HotRod blueCar;
Car[] garage = new Car[10];
SpriteObject troll;
SpriteObject bird;
SpriteObject dog;
 
void setup()
{
  size(500, 500);
   
  garage[0] = new Car();
  bird = new SpriteObject("bird.jpg");
  bird.y = 200;
  bird.speed = 2;
  bird.s = .1;
  bird.directionY = 1;
  bird.directionX = 1.5;
  dog = new SpriteObject("dog.jpg");
  //dog.x = x;
  //dog.y = y;
  dog.s = .1;

   
  for (int i =0; i < 10; i += 1)
  {
    garage[i] = new Car();
    garage[i].x = random(width);
    garage[i].directionX = random(-1, 1);
  
    garage[i].directionY = random(-1, 1);
    Car currentCar = garage[i];
    currentCar.y = random(height);
  }
   
  redCar = new Car();
  redCar.x = 100;
  redCar.y = 300;
  redCar.w = 40;
  redCar.h = 90;
  redCar.speed = 1;
  redCar.carColor = color(255,0,0);
   
  blueCar = new HotRod();
  blueCar.x = 400;
  blueCar.y = 100;
  blueCar.speed = 2;
  //blueCar.carColor = color(0,0,255);
}
void draw()
{
  background(0);
  dog.seek();
  dog.render();
  
  bird.update();
   bird.render();
   //bird.drive();
  
  
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
  float easing = 0.05;
     
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
    
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.s))
      && mouseX < (this.x + (this.w * 0.5 * this.s))
      && mouseY > (this.y - (this.h * 0.5 * this.s))
      && mouseY < (this.y + (this.h * 0.5 * this.s)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
    
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
       
    float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s); 
       
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
  
  void update()
  {
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      this.speed += 5;
      this.rotation += 33;
      this.s += .1;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      this.speed -= 4.5;
      this.s -= .2;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * random(0.5));
      this.directionY = -this.directionY;
      this.s -= .1;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * random(0.35));
      this.directionY = -this.directionY;
    }
     
    this.y += directionY * speed;
    this.x += directionX * speed;
  }
  void seek()
{
  float targetX = bird.x;
  float dx = targetX - x;
  if(abs(dx) > 1)
  {
    x += dx * easing;
  }
  
  float targetY = bird.y;
  float dy = targetY - y;
  if(abs(dy) > 1)
  {
    y += dy * easing;
  }
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

  



