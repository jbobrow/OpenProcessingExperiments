
Car blueCar;
Car redCar;
HotRod[] garage = new HotRod[20];
float timer;
SpriteObject troll;

void setup()
{
  size(500, 500);
  
  troll = new SpriteObject("troll.png");
  troll.y = 200;
  troll.directionX = 1;
  troll.directionY = 0;
  troll.speed = 5;
  
  for (int i = 0; i < 10; i += 1)
  {
    garage[i] = new HotRod();
    Car currentCar = garage[i];
    currentCar.x = random(width);
    currentCar.y = random(height);
    currentCar.directionX = random(-1, 1);
    currentCar.directionY = random(-1, 1);

    // normalize our direction so always length 1 and doesnt affect speed
    float ax = currentCar.directionX;
    float ay = currentCar.directionY;
    float directionLength = sqrt((ax * ax) + (ay * ay));
    currentCar.directionX /= directionLength;
    currentCar.directionY /= directionLength;
    
    //currentCar.carColor = color(random(255), random(255), random(255));
  }
  
  blueCar = new Car();
  blueCar.carColor = color(0, 0, 255);
  blueCar.x = 200;
  blueCar.y = 200;
  
  redCar = new Car();
  redCar.carColor = color(255, 0, 0);
  redCar.x = 400;
  redCar.y = 300;
  redCar.directionY = -1;
  redCar.directionX = 1;
  redCar.speed = 0.5;
}

void draw()
{
  background(0);

  troll.update();
  troll.render();
  
  timer += 0.0167;
  blueCar.drive();
  redCar.drive();
  blueCar.render();
  redCar.render();
  
  for (int i = 0; i < 10; i += 1)
  {
    HotRod currentCar = garage[i];
    if (timer > 10)
    {
      if (i == 9)
      {
        timer = -100;
      }
      currentCar.NOS(); 
      currentCar.directionX = -currentCar.directionX;
      currentCar.directionY *= -1;
    }
    currentCar.drive();
    currentCar.render();
  }
}

class HotRod extends Car
{
  HotRod()
  {
    this.speed = 3;
    this.carColor = color(255, 255, 0);
  }
  
  void NOS()
  {
    this.speed = 10;
  }
  
  void drive()
  {
    // Hotrods will not bounce but instead Wrap around
    
    // Get components of line equation  
    float slope = 0;
    if (this.directionX != 0)
    {
      slope = (this.directionY / this.directionX);
    }
    float mx = slope * this.x;
    float b = this.y - mx;
   
    if (this.x > width + 25 && this.directionX >= 0)
    {
      // Set x to opposite side
      this.x = -25;

      // y = mx + b
      this.y = slope * this.x + b;
    }
    else if (this.x < -25 && this.directionX < 0)
    {
      // Set x to opposite side
      this.x = width + 25;
      
       // y = mx + b
      this.y = slope * this.x + b;
    }
    else if (this.y > height + 50 && this.directionY >= 0)
    {
      // Set y to opposite side
      this.y = -50;

      // x = (y - b) / m
      if (slope != 0)
      {
        this.x = (this.y - b) / slope;
      }

    }
    else if (this.y < -50 && this.directionY < 0 )
    {
      // Set y to opposite side
      this.y = height + 50;

      // x = (y - b) / m
      if (slope != 0)
      {
        this.x = (this.y - b) / slope;
      }
    }
    this.x += this.directionX * speed;  
    this.y += this.directionY * speed;
  }
}

class Car
{
  float x;
  float y;
  float directionX = 0;
  float directionY = 1;
  float speed = 3;
  color carColor;
  
  void drive()
  {
    // Bounce the car if it goes off screen
    
    if (this.x > width - 25 && this.directionX > 0)
    {
      this.directionX *= -1;
      this.x = width - 25;
    }
    if (this.x < 25 && this.directionX < 0)
    {
      this.directionX *= -1;
      this.x = 25;
    }
    if (this.y > height - 50 && this.directionY > 0)
    {
      this.directionY *= -1;
      this.y = height - 50;
    }
    if (this.y < 50 && this.directionY < 0)
    {
      this.directionY *= -1;
      this.y = 50;
    }
    
    // Move the car by the direction and speed
    this.x += this.directionX * speed;  
    this.y += this.directionY * speed;
  }
  
  void stop()
  {
    this.speed = 0;
  }
  
  void go(float s)
  {
    this.speed = s;  
  }
  
  void turn()
  {
  }
  
  void render()
  {
    rectMode(CENTER);
    fill(this.carColor);
    rect(this.x, this.y, 50, 100);
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
   
  boolean isOverlappingRect(float otherLeft, float otherTop, float rwidth, float rheight)
  {
   float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
     
    float otherRight = otherLeft + rwidth;
    float otherBottom = otherTop + rheight;
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
  
  void update()
  {
    // If hitting Right
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    
    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    
    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
    
    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
    
    // Move the sprite 
    this.y += directionY * speed;
    this.x += directionX * speed;
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



