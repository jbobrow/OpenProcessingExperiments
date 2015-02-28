
SpriteObject[] Butterfly = new SpriteObject[25];
SpriteObject ageButterfly; 
SpriteObject newButterfly;
float timer = 0;
float brightness = 80;

void setup()
{
  size(500,500);
  background(0);
  colorMode(HSB, 360, 100, 100);
  smooth();
  noStroke();
  
  for(int i = 0; i < 15; i++)
  {
  Butterfly[i] = new SpriteObject();
  Butterfly[i].x = random(width);
  SpriteObject currentSpriteObject = Butterfly[i];
  currentSpriteObject.y = random(height);
  Butterfly[i].w = 40;
  Butterfly[i].h = 90;
  Butterfly[i].directionX = random(-1,1);
  Butterfly[i].directionY = random(-1,1);
  Butterfly[i].speed = 10;
  Butterfly[i].s = 0.3;
  Butterfly[i].butterflyColor = color(random(360), random(100), random(50,100));
  }
  
  ageButterfly = new SpriteObject();
  ageButterfly.w = 40;
  ageButterfly.h = 90;
  ageButterfly.directionX = 1;
  ageButterfly.directionY = 1;
  ageButterfly.s = 1;
  ageButterfly.speed = 10;
  ageButterfly.butterflyColor = color(321,99,brightness);
  
  newButterfly = new SpriteObject();
  newButterfly.w = 40;
  newButterfly.h = 90;
  newButterfly.x = 100;
  newButterfly.y = 400;
  newButterfly.directionX = 1;
  newButterfly.directionY = 1;
  newButterfly.s = .5;
  newButterfly.speed = 3;
}

void draw()
{
  frameRate(18);
  timer += 0.0167;
  brightness -= .08;
  if (timer >= 2)
  {
   ageButterfly.y += 40;
   ageButterfly.s -= 0.05;
   ageButterfly.butterflyColor = color(321,99,brightness);
  }
  if(ageButterfly.s < 0)
  {
    ageButterfly.s = 0;
  }

   fill(0,200);
  rect(0,0,width,height);
  
  for(int i = 0; i < 15; i++)
  {
    if (newButterfly.isOverlapping(Butterfly[i]))
  {
    Butterfly[i].s = 0;
    newButterfly.s += 0.01;
  }
  Butterfly[i].update();
  Butterfly[i].render();
  }
  ageButterfly.update();
  ageButterfly.render(); 
  
  newButterfly.butterflyColor = color(random(360), random(100), random(50,100));
  newButterfly.update();
  newButterfly.render(); 
  
  println(timer);
}

 
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = 50;
  float h = 100;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s;
  color butterflyColor;
  
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
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
       
    this.y += directionY * speed;
    this.x += directionX * speed;
    
  float waveSpeed = 2;
  float waveHeight = 2;
  float angle = ageButterfly.x * waveSpeed;
  float offset = sin(radians(angle)) * waveHeight;

  ageButterfly.x += noise(-1,10);
  ageButterfly.y += noise(-1,10);

  }
  
   void render()
  {
    fill(this.butterflyColor,190);
    pushMatrix();
    translate(this.x, this.y);
    scale(s);
    rotate(radians(180));
    bezier(0,0, random(0,200), random(0,200), random(200,500), random(200,500),0,0);
     bezier(0,0, random(0,300), random(0,300), random(200,600), random(200,600),0,0);
    popMatrix();
  }
}


