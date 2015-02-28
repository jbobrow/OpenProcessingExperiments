
SpriteObject troll;
SpriteObject asteroid;
SpriteObject asteroid1;
SpriteObject asteroid2;
SpriteObject asteroid3;
SpriteObject asteroid4;
SpriteObject asteroid5;
SpriteObject asteroid6;
SpriteObject asteroid7;


void setup()
{
  size(500,500);
  troll =  new SpriteObject("troll.png");
  troll.x = 0.0;
  troll.y = width/2;
  troll.s = 0.08;
  
  asteroid =  new SpriteObject("asteroid.png");
  asteroid.x = width;
  asteroid.y = 0;
  asteroid.s = .1;

  asteroid1 =  new SpriteObject("asteroid.png");
  asteroid1.x = width * .85;
  asteroid1.y = -50;
  asteroid1.s = .1;

  asteroid2 =  new SpriteObject("asteroid.png");
  asteroid2.x = width * .70;
  asteroid2.y = -100;
  asteroid2.s = .1;
  
  asteroid3 =  new SpriteObject("asteroid.png");
  asteroid3.x = width * .55;
  asteroid3.y = -150;
  asteroid3.s = .1;
  
  asteroid4 =  new SpriteObject("asteroid.png");
  asteroid4.x = width * .40;
  asteroid4.y = -200;
  asteroid4.s = .1;
  
  asteroid5 =  new SpriteObject("asteroid.png");
  asteroid5.x = width * .25;
  asteroid5.y = -250;
  asteroid5.s = .1;

  asteroid6 =  new SpriteObject("asteroid.png");
  asteroid6.x = width * .10;
  asteroid6.y = -300;
  asteroid6.s = .1;
  
  asteroid7 =  new SpriteObject("asteroid.png");
  asteroid7.x = width * .0;
  asteroid7.y = -350;
  asteroid7.s = .1;
}

void draw()
{
  background(255);
  

  float left = asteroid.x - (asteroid.w * 0.5 * asteroid.s);
  float right = asteroid.x + (asteroid.w * 0.5 * asteroid.s);
  float top = asteroid.y - (asteroid.h * 0.5 * asteroid.s);
  float bottom = asteroid.y + (asteroid.h * 0.5 * asteroid.s);
  
  float left1 = asteroid1.x - (asteroid1.w * 0.5 * asteroid1.s);
  float right1 = asteroid1.x + (asteroid1.w * 0.5 * asteroid1.s);
  float top1 = asteroid1.y - (asteroid1.h * 0.5 * asteroid1.s);
  float bottom1 = asteroid1.y + (asteroid1.h * 0.5 * asteroid1.s);
  
  float left2 = asteroid2.x - (asteroid2.w * 0.5 * asteroid2.s);
  float right2 = asteroid2.x + (asteroid2.w * 0.5 * asteroid2.s);
  float top2 = asteroid2.y - (asteroid2.h * 0.5 * asteroid2.s);
  float bottom2 = asteroid2.y + (asteroid2.h * 0.5 * asteroid2.s);
  
  float left3 = asteroid3.x - (asteroid3.w * 0.5 * asteroid3.s);
  float right3 = asteroid3.x + (asteroid3.w * 0.5 * asteroid3.s);
  float top3 = asteroid3.y - (asteroid3.h * 0.5 * asteroid3.s);
  float bottom3 = asteroid3.y + (asteroid3.h * 0.5 * asteroid3.s);
  
  float left4 = asteroid4.x - (asteroid4.w * 0.5 * asteroid4.s);
  float right4 = asteroid4.x + (asteroid4.w * 0.5 * asteroid4.s);
  float top4 = asteroid4.y - (asteroid4.h * 0.5 * asteroid4.s);
  float bottom4 = asteroid4.y + (asteroid4.h * 0.5 * asteroid4.s);
  
  float left5 = asteroid5.x - (asteroid5.w * 0.5 * asteroid5.s);
  float right5 = asteroid5.x + (asteroid5.w * 0.5 * asteroid5.s);
  float top5 = asteroid5.y - (asteroid5.h * 0.5 * asteroid5.s);
  float bottom5 = asteroid5.y + (asteroid5.h * 0.5 * asteroid5.s);
  
  float left6 = asteroid6.x - (asteroid6.w * 0.5 * asteroid6.s);
  float right6 = asteroid6.x + (asteroid6.w * 0.5 * asteroid6.s);
  float top6 = asteroid6.y - (asteroid6.h * 0.5 * asteroid6.s);
  float bottom6 = asteroid6.y + (asteroid6.h * 0.5 * asteroid6.s);
  
  float left7 = asteroid7.x - (asteroid7.w * 0.5 * asteroid7.s);
  float right7 = asteroid7.x + (asteroid7.w * 0.5 * asteroid7.s);
  float top7 = asteroid7.y - (asteroid7.h * 0.5 * asteroid7.s);
  float bottom7 = asteroid7.y + (asteroid7.h * 0.5 * asteroid7.s);
   

  if (keyPressed == true)
  {
    if (keyCode == RIGHT)
    {
      troll.x += 10;
    }
    if (keyCode == LEFT)
    {
      troll.x -= 10;
    }
        if (keyCode == UP)
    {
      troll.y -= 10;
    }
    if (keyCode == DOWN)
    {
      troll.y += 10;
    }
  }
   

  asteroid.y += 1;
  asteroid1.y += 1;
  asteroid2.y += 1;
  asteroid3.y += 1;
  asteroid4.y += 1;
  asteroid5.y += 1;
  asteroid6.y += 1;
  asteroid7.y += 1;
  

  if (asteroid.isOverlapping(troll))
  {
    tint(255, 0, 0);
  }
  else
  {
    tint(255); // reset to white otherwise
  }
  
    if (troll.isOverlapping(asteroid1))
  {
    tint(150,0,0);
  }
  else
  {
    tint(255); // reset to white otherwise
  }
  
    if (asteroid2.isOverlapping(troll))
  {
    tint(0, 150, 0);
  }
  else
  {
    tint(255); // reset to white otherwise
  }
  
    if (troll.isOverlapping(asteroid3))
  {
    tint(0, 255, 0);
  }
  else
  {
    tint(255); // reset to white otherwise
  }
  
    if (troll.isOverlapping(asteroid4))
  {
    tint(0, 0, 150);
  }
  else
  {
    tint(255); // reset to white otherwise
  }
  
    if (troll.isOverlapping(asteroid5))
  {
    tint(0, 0, 255);
  }
  else
  {
    tint(255); // reset to white otherwise
  }
  
    if (troll.isOverlapping(asteroid6))
  {
    tint(100, 100, 100);
  }
  else
  {
    tint(255); // reset to white otherwise
  }
  
    if (troll.isOverlapping(asteroid7))
  {
    tint(100, 100, 255);
  }
  else
  {
    tint(255); // reset to white otherwise
  }
  if (troll.isMouseOverlapping() == false)
  {
    troll.render();
  }
   
  // do the same for skull but with different colors
  if (asteroid.isOverlapping(troll))
  {
    tint(0, 255, 0);
  }
  else
  {
    tint(255);
  }  
  
  if (asteroid.isMouseOverlapping() == false)
  {
   asteroid.render();
  }
  
    if (asteroid1.isMouseOverlapping() == false)
  {
   asteroid1.render();
  }
  
    if (asteroid2.isMouseOverlapping() == false)
  {
   asteroid2.render();
  }
  
    if (asteroid3.isMouseOverlapping() == false)
  {
   asteroid3.render();
  }
  
    if (asteroid4.isMouseOverlapping() == false)
  {
   asteroid4.render();
  }
  
    if (asteroid5.isMouseOverlapping() == false)
  {
   asteroid5.render();
  }
  
    if (asteroid6.isMouseOverlapping() == false)
  {
   asteroid6.render();
  }
  
    if (asteroid7.isMouseOverlapping() == false)
  {
   asteroid7.render();
  }
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
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
    
    if (mouseX > (this.x - (this.w * .5 * this.s))
      &&  mouseX < (this.x + (this.w * .5 * this.s))
      &&  mouseY > (this.y - (this.h * .5 * this.s))
      &&  mouseY < (this.y + (this.h * .5 * this.s)))
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




