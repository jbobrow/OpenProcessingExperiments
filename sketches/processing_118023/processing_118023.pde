
float timer;
SpriteObject smiley;
Predator monster;
float easing = 0.05;


void setup()
{
  size(500, 500);

  smiley = new SpriteObject("smile.png");
  smiley.x = width/random(2);
  smiley.y = height/random(2);
  smiley.s = 0.2;
  smiley.directionX = 0.1;
  smiley.directionY = 0.1;
  smiley.speed = 40;

  monster = new Predator("predator.png");
  monster.s = 0.5;
  monster.directionX = 0.1;
  monster.directionY = 0.1;
  monster.speed = 40;
}



void draw()
{
  background(255);

  smiley.render();
  smiley.update();

  monster.render();
  monster.update();

}


class Predator extends SpriteObject 
{ 

  float easing = 0.05;

  Predator(String filename) 
  { 
    super(filename);
  }

    void update()
    {

      float targetX = smiley.x;
      float dx = targetX - x;
      if (abs(dx) > 1) 
        {
          x += dx * easing;
        }

      float targetY = smiley.y;
      float dy = targetY - y;
      if (abs(dy) > 1)
        {
          y += dy * easing;
        }
    }
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float directionX;
  float directionY;
  float speed = 1.5;
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
      this.speed = 50;
    }

    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      this.speed = 30;
    }

    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.s = .1;
    }

    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.s = .5;
    }

    // Move the sprite
    this.y += directionY * speed * random(5);
    this.x += directionX * speed * random(5);
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




