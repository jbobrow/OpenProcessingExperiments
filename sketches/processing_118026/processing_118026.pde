
float timer;
SpriteObject ball;
Predator bulb;
PImage background;
void setup()
{
  size(500, 500);
  
  background = requestImage("poke.png");

  ball = new SpriteObject("ball.png");
  ball.y = 5;
  ball.directionX = 1;
  ball.directionY = 0.3;
  ball.speed = 5;
  ball.s = .1;

  bulb = new Predator("pokemon.png");
  bulb.y = 300;
  bulb.directionX = .5;
  bulb.directionY = 0.3;
  bulb.speed = 5;
  bulb.s = .5;

}

void draw()
{
  image(background,width/2,height/2,500,500);

  ball.update();
  ball.render();

  bulb.update();
  bulb.render();

}

class Predator extends SpriteObject
{
  float easing = 0.05;

  void update()
  {
    float targetY = ball.y;
    float dy = targetY - y;
    if (abs(dy) > 1) {
      y += dy * easing;
    }

    float targetX = ball.x;
    float dx = targetX - x;

    if (abs(dx) > 1) 
    {
      x += dx * easing;
    }
  }


  Predator (String filename)
  {
    super(filename);
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
    // If hitting Right
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      ball.speed = 7;
    }

    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
      ball.speed = 3;
    }

    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      ball.s = .05;
    }

    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      ball.s = .15;
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



