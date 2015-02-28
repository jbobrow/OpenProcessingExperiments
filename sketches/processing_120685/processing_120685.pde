
PImage stars;
Void player;
Void zodiac;
Void enemy1;
Void enemy2;
Void item;
float angle = 0.0;

void setup()
{
  size(700,700);
  stars = requestImage("Star-field.jpg");
  zodiac = new Void("Zodiac_Ophiuchus.jpg");
  zodiac.x = random(100, 650);
  zodiac.y = random(100, 650);
  zodiac.s = 0.4;
  enemy1 = new Void("enemy1.jpg");
  enemy1.x = random(100, 650);
  enemy1.y = random(100, 650);
  enemy2 = new Void("enemy2.jpg");
  enemy2.x = random(100, 650);
  enemy2.y = random(100, 650);
  item = new Void("item.jpg");
  item.x = random(100, 650);
  item.y = random(100, 650);
  player = new Void("black_hole.jpg");
   
}
void draw()
{
  angle += 0.1;
      if (angle > TWO_PI)
      {
        angle = 0;
      }
      
  if(stars.width > 0)
  {
   image(stars, 0, 0, width*2, height*2);
  }
  
  player.targetX = mouseX;
  player.targetY = mouseY;
  player.render();
  player.update();
  
  zodiac.targetX = player.x;
  zodiac.targetY = player.y;
  zodiac.render();
  zodiac.update();
  
  enemy1.targetX = player.x;
  enemy1.targetY = player.y;
  enemy1.render();
  enemy1.update();
  
  enemy2.targetX = player.x;
  enemy2.targetY = player.y;
  enemy2.render();
  enemy2.update();
  
  item.targetX = player.x;
  item.targetY = player.y;
  item.render();
  item.update();
  
  if (enemy2.isOverlapping(enemy1) == true)
  {
    enemy2.x = random(200, 650);
    enemy2.y = random(200, 650);
  }
  if (enemy2.isOverlapping(item) == true)
  {
    enemy2.x = random(200, 650);
    enemy2.y = random(200, 650);
  }
  if (enemy2.isOverlapping(zodiac) == true)
  {
    enemy2.x = random(200, 650);
    enemy2.y = random(200, 650);
  }
  if (enemy1.isOverlapping(enemy2) == true)
  {
    enemy1.x = random(10, 150);
    enemy1.y = random(10, 150);
  }
  if (enemy1.isOverlapping(item) == true)
  {
    enemy1.x = random(10, 150);
    enemy1.y = random(10, 150);
  }
  if (enemy1.isOverlapping(zodiac) == true)
  {
    enemy1.x = random(10, 150);
    enemy1.y = random(10, 150);
  }
  if (zodiac.isOverlapping(enemy1) == true)
  {
    zodiac.x = random(150, 650);
    zodiac.y = random(150, 650);
  }
  if (zodiac.isOverlapping(enemy2) == true)
  {
    zodiac.x = random(150, 650);
    zodiac.y = random(150, 650);
  }
  if (zodiac.isOverlapping(item) == true)
  {
    zodiac.x = random(150, 650);
    zodiac.y = random(150, 650);
  }
  if (item.isOverlapping(enemy2) == true)
  {
    item.x = random(30, 150);
    item.y = random(30, 150);
  }
  if (item.isOverlapping(enemy1) == true)
  {
    item.x = random(30, 150);
    item.y = random(30, 150);
  }
  if (item.isOverlapping(zodiac) == true)
  {
    item.x = random(30, 150);
    item.y = random(30, 150);
  }
  if (zodiac.isOverlapping(player) == true)
  {
    pushMatrix();
    translate(zodiac.x,zodiac.y);
    rotate(angle);
    popMatrix();
  }
  
  if (item.isOverlapping(player) == true)
  {
    pushMatrix();
    translate(item.x,item.y);
    rotate(angle);
    popMatrix();
  }
  
  if (enemy1.isOverlapping(player) == true)
  {
    pushMatrix();
    translate(enemy1.x,enemy1.y);
    rotate(angle);
    popMatrix();
  }
  
  if (enemy2.isOverlapping(player) == true)
  {
    pushMatrix();
    translate(enemy2.x,enemy2.y);
    rotate(angle);
    popMatrix();
  }
}


class Void extends SpriteObject
{
  float targetX;
  float targetY;
  color newColor;
  float easing = 0.06;

  Void(String filename)
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
    //player.targetX = mouseX;
    float dx = targetX - x;
    if(abs(dx) > 1) 
    {
      x += dx * easing;
    }
    //player.targetY = mouseY;
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



