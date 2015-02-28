
SpriteObject ghost;
SpriteObject[] graveyard = new SpriteObject[10];
SpriteObject worm;
Predator skeleton;
float timer = 0;
float redTimer = 255;
float greenTimer = 255;
float blueTimer = 255;
float transparencyTimer = 255;
int nineValue = 800;
int wormSide = 0;

void setup()
{
  size(700, 700);

  ghost = new SpriteObject("Ghost.png");
  ghost.x = 600;
  ghost.y = 350;
  ghost.s = .1;
  ghost.directionX = 0.1;
  ghost.directionY = 0.1;
  ghost.speed = 50;
  
  worm = new SpriteObject("worm.png");
  worm.x = 500;
  worm.y = 250;
  worm.s = .2;
  worm.directionX = 0.1;
  worm.directionY = 0.1;
  worm.speed = 10;
  
  skeleton = new Predator("skeleton.png");
  skeleton.x = 650;
  skeleton.y = 250;
  skeleton.s = .2;
  skeleton.directionX = 0.1;
  skeleton.directionY = 0.1;
  skeleton.speed = 10;

  for (int i=0; i < 10 ; i++)
  {
    graveyard[i] = new SpriteObject("graveyard.png");
    graveyard[i].s = .3;
  }

  for (int i= 0; i < 5 ; i++)
  {
    graveyard[i].y = 200;
  }

  for (int i= 5; i < 9 ; i++)
  {
    graveyard[i].y = 600;
  }

  graveyard[0].x = 60;
  graveyard[1].x = 210;
  graveyard[2].x = 360;
  graveyard[3].x = 510;
  graveyard[4].x = 660;
  graveyard[5].x = 60;
  graveyard[6].x = 210;
  graveyard[7].x = 360;
  graveyard[8].x = 510;
  graveyard[9].x = 660;
  
}

void draw()
{
  
 
  timer += 0.0167;
  graveyard[9].y = nineValue;
  if(timer < 10)
  {
    redTimer -= 0.1336;
    greenTimer -= 0.1336;
    blueTimer -= 0.1336;
  }
  if (timer > 10)
  {
    redTimer -= .2672;
    greenTimer -= .2672;
    blueTimer -= .2672;
    
  }
  background(220);

  for (int k = 0; k < 10; k++)
  {
    noTint();
    graveyard[k].render();
  }
  tint(redTimer, greenTimer, blueTimer, transparencyTimer);
  ghost.render();
  ghost.update();
  if (timer > 5 && timer < 10)
  {
    ghost.speed = 0;
    textSize(20);
    fill(40, 255, 40); 
    text("I wonder if ghosts ever get old...", width/2, height/2);
  }

  if (timer > 10 && timer <15)
  {
    ghost.speed = 50;
  }
  
  if (timer > 15 && timer < 20)
  {
    ghost.speed = 0;
    text("Wait am I getting darker? Is this how ghosts age? No!!!!", 0, height/2);
    transparencyTimer--;
  }
  if (timer > 20 && timer < 25 && nineValue > 600)
  {
    nineValue--;
  }
  if (timer > 25)
  {
    noTint();
   if(wormSide == 2)
  { 
    tint(255,255,255,0);
  } 
   worm.render();
   }
  if (timer > 25 && timer < 30)
  {
    fill(255,0,0);
    text("Finally that ghost is gone... now I can be at peace.", 0, height/2);
    worm.x--;
  }
  if (timer > 30)
  {
    noTint();
    skeleton.render();
  }
  if (timer > 30 && timer < 35)
  {
    fill(0,0,255);
    text("That's what you think!", 0, height/2 + 25);
    fill(255,0,0);
    text("Ahhhh!", 0, height/2);
    
  }
  
  if (timer > 30 && wormSide == 0)
  {
    skeleton.x--;
    worm.x -= .5;
    
  }
  
  if(worm.x == 25)
  {
    wormSide = 1;
  }
  
  if(wormSide == 1)
  {
    worm.update();
    skeleton.update();
  }
  
  if(skeleton.isOverlapping(worm))
  {
     wormSide = 2;
     if (skeleton.s <= 1)
     {
       skeleton.s +=0.0167;
      } 
     
  }
  
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
 
 float targetX = worm.x;
 float dx = targetX - x;
 if (abs(dx) > 1)
 {
 x += dx * easing;
 }
 
 float targetY = worm.y;
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
  float speed = 1;
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



