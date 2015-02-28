
SpriteObject pig;
float easing = 0.05;
float x;
float y;
PImage tiger;

void setup()
{
  size(500, 500);

  pig = new SpriteObject("pig.png");
  tiger = loadImage("tiger.png");
  pig.y = 200;
  pig.directionX = 1;
  pig.directionY = 1;
  pig.speed = 5;
}

void draw()
{
  background(0);

  float targetX = pig.x;
  float dx = targetX - x;
  if (abs(dx) > 1) {
    x += dx * easing;
  }

  float targetY = pig.y;
  float dy = targetY - y;
  if (abs(dy) > 1) {
    y += dy * easing;
  }
  image(tiger, x, y, 50, 50);
  
  pig.update();
  pig.render();
}





class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float directionX = (height / 2) + sin(radians(PI)) * (height / 2);
  float directionY = (height / 2) + cos(radians(PI)) * (height / 2);
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
    // If hitting Right
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      speed +=2;
    }

    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      speed -=2;
    }

    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.w-=10;
      this.y-=10;
    }

    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.w+=10;
      this.y+=10;
    }

    // Move the sprite
    this.y += (directionY+random(-1, 1)) * speed;
    this.x += (directionX+random(-1, 1)) * speed;
  }

  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = width/8;
      }
      if (this.h == -1.0)
      {
        this.h = height/8;
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



