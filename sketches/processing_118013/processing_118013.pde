
SpriteObject troll;
Predator teeth;
void setup()
{
  size(800, 600);

  troll = new SpriteObject("mikhail2.jpg");
  troll.y = 200;
  troll.directionX = 1;
  troll.directionY = -1;
  troll.speed = 5;

  teeth = new Predator("predator.jpg");
  teeth.y = 700;
  teeth.directionX = 1;
  teeth.directionY = -1;
  teeth.speed = 5;

  /*for (int i = 0; i < 10; i += 1)
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
   */
}
void draw()
{
  background(0);

  teeth.update();
  teeth.render();

  troll.update();
  troll.render();

  if (teeth.isOverlapping(troll))
  {
    teeth.s = 3;
  }
  else
  {
    teeth.s = 1;
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
  float change=100;
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
      /*if(random(-5,5)>=3)
       {
       this.directionY = -this.directionY;
       }
       */      speed*=2;
    }

    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      /*if(random(-5,5)>=3)
       {
       this.directionY = -this.directionY;
       }
       */      speed/=2;
    }

    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      /*if(random(-5,5)>=3)
       {
       this.directionX = -this.directionX;
       }
       */      change/=3;
    }

    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      /*if(random(-5,5)>=3)
       {
       this.directionX = -this.directionX;
       }
       */      change*=3;
    }

    // Move the sprite
    this.y += directionY * (speed+random(-10, 10));
    this.x += directionX * (speed+random(-7, 7));
  }



  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = 75;
      }
      if (this.h == -1.0)
      {
        this.h = 100;
      }
    }

    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, change/1.25, change);
      popMatrix();
    }
  }
}

class Predator extends SpriteObject
{
 
  Predator(String filename)
  {
    super(filename); 
  }

  void update()
  { 
    // Move the sprite
    if (this.y<troll.y)
    {
      this.y+=speed;
    }
    if (this.x<troll.x)
    {
      this.x+=speed;
    }
    if (this.y>troll.y)
    {
      this.y-=speed;
    }
    if (this.x>troll.x)
    {
      this.x-=speed;
    }
    speed=random(0, 5);
  }
}



