
Cat myCat;
Balloon myBalloon;
Littlem myLittlem;
Fly myFly;

boolean forwardKeyPressed = false;
boolean backwardKeyPressed = false;
boolean rightKeyPressed = false;
boolean leftKeyPressed = false;
boolean bossHit = false;

PImage grass;
PImage cat;
PImage balloon;
PImage fly;
PImage proud;
PImage scaredcat;

float timer = 15;

PFont futura;
 
void setup()
{
  size(400, 400);
  grass = requestImage ("grass.jpg");
  textSize(20);
  frameRate(30);
  
  myCat = new Cat();
  myBalloon = new Balloon();
  myLittlem = new Littlem();
  myFly = new Fly();
    
  
  myCat.x = 200;
  myCat.y = 200;
    
  myCat.directionX = 0;
  myCat.directionY = 1;
  
  myCat.speed = 6;
  
  proud = requestImage("proud.jpg");
  scaredcat = requestImage("scaredcat2.jpg");
  
  futura = createFont("Futura Medium", 20);
}
  
void draw()
{
  
      background(100);
       
      imageMode(CORNER);
      if (timer <= 0 || myCat.hp <= 0)
      {
        textAlign (CORNER);
        text ("seconds left: TIMES UP", 5, 45);
        if (myCat.hp <= 0)
        {
          image(scaredcat, 0, 0, width, height);
         // tint(255, 0, 0);
          textAlign (CENTER);
          fill (#FFFFFF);
          textFont(futura);
          textSize (24);
          text("The cat is too scared to go on.", 0, 280, width, height);
          text("His spirit is broken, and he collapses in sadness.", 0, 320, width, height);
        }
        
        if (myCat.hp > 0)
        { 
          image (proud, 0, 0, width, height);
          textAlign (CENTER);
          fill(#FFFFFF);//000066
          textFont(futura);
          textSize (28);
          text("The cat is not afraid of anything!!!", 0, 280, width, height);
        }
      }
      else
      {
        image(grass, 0, 0, width, height);
        timer = timer - (1.0 / 30.0);
        text ("seconds left: " + (int)timer, 5, 45);
          
        if (dist(myBalloon.x, myBalloon.y, myCat.x, myCat.y) < 40)
        {
          myCat.x += random(-myCat.scaredAmount, myCat.scaredAmount);
          myCat.y += random(-myCat.scaredAmount, myCat.scaredAmount);
          myCat.scaredAmount += .2;
          myCat.hp += 2;
          tint(#FFFF00);
        }
        if (dist(myFly.x, myFly.y, myCat.x, myCat.y) < 40)
        {
          myCat.x += random(-myCat.scaredAmount, myCat.scaredAmount);
          myCat.y += random(-myCat.scaredAmount, myCat.scaredAmount);
          tint(255, 0, 0);
          myCat.hp -= 5;
        }
        if (dist(myLittlem.x, myLittlem.y, myCat.x, myCat.y) < 40)
        {
          myCat.x += random(-myCat.scaredAmount, myCat.scaredAmount);
          myCat.y += random(-myCat.scaredAmount, myCat.scaredAmount);
          tint(255, 0, 0);
          myCat.hp -= 10;
        }
          
        myCat.draw();
        noTint();
        myBalloon.draw();
        myLittlem.draw();
        myFly.draw(myCat.x, myCat.y);
      }
      
   if (myCat.hp < 45) 
      {
        fill (255, 0, 0);
      }
      else if (myCat.hp < 75)
      {
        fill (255, 255, 0);
      }
      else
      {
        fill(0, 0, 0);
      }
      
      if (myCat.hp < 0)
      {
        myCat.hp = 0;
      }
      if(myCat.hp > 100)
      {
        myCat.hp = 100;
      }
      rect (5, 5, 150, 20);
      fill(0, 255, 0);//0, 255, 0
      noStroke();
      rect(5, 5, 150 * (myCat.hp / 100), 20);
      
      noFill();
      stroke(#330099);//255
      rect (5, 5, 150, 20);
      fill(#330099);//255
}
 

class Littlem
{
  float x = 100;
  float y = 100;
  float speed = 2;
  PImage img;
  
  Littlem()
  {
    this.img = requestImage("littlem.png");
  }
  
  void draw()
  {
    this.x += this.speed;
    if(this.x > width - (width/6 / 2) || this.x < (width/6 / 2))
    {
      this.speed = -this.speed;
    }
    if (this.img.width > 0)
    {
      pushMatrix();
      translate(this.x, this.y);
      if (this.speed > 0)
     {
        scale(-1, 1);
      }
     imageMode(CENTER);
     image(this.img, 0, 0, width/6, height/6);
     imageMode(CORNER);
     popMatrix();
    }
  }
}
  
void keyPressed()
{
    if (keyCode == UP)
    {
      forwardKeyPressed = true;
      myCat.sprite.setAnimation(12, 15, true);
    }
    if (keyCode == DOWN)
    {
      backwardKeyPressed = true;
      myCat.sprite.setAnimation(0, 3, true);
    }
    if (keyCode == RIGHT)
    {
      rightKeyPressed = true;
      myCat.sprite.setAnimation(8, 11, true);
    }
    if (keyCode == LEFT)
    {
      leftKeyPressed = true;
      myCat.sprite.setAnimation(4, 7, true);
    }
}
  
void keyReleased()
{
    if (keyCode == UP)
    {
      forwardKeyPressed = false;
      myCat.sprite.setAnimation(0, 0, true);
    }
    if (keyCode == DOWN)
    {
      backwardKeyPressed = false;
      myCat.sprite.setAnimation(0, 0, true);
    }
    if (keyCode == RIGHT)
    {
      rightKeyPressed = false;
    }
    if (keyCode == LEFT)
    {
      leftKeyPressed = false;
    }
    {
  }
}





class Fly
{
  float x = 50;
  float y = 350;
  PImage img;
  float easing = 0.05;

  Fly()
  {
    this.img = requestImage("fly.png");
  }
  
  void draw(float targetx, float targety)
  {
    float toX = targetx - this.x;
    float toY = targety - this.y;

    this.x += (toX * this.easing);
    this.y += (toY * this.easing);
     
    if (img.width > 0)
    {
      imageMode(CENTER);
      image(img, this.x, this.y, 100, 100);
      imageMode(CORNER);
    }
  }
}








class Balloon
{
  PImage Balloon;
  float x = 200;
  float y = 250;
  float radius = 12.0;
  float speedX = 1.0;
  float speedY = 2.0;
  int directionX = 1;
  int directionY = -1;
  
  
  Balloon()
  {
    Balloon = loadImage("balloon.png");
   }
   
   void draw()
   {
     imageMode(CENTER);
     image(Balloon, x, y, width/8, height/6);
     imageMode(CORNER);
     
     pushMatrix();
     translate(x, y);
     scale(directionX, 1);
     popMatrix();
     
     x += sin(y * 0.1) + (speedX * directionX);
     if ((x > width-radius) || (x < radius)) 
     {
          directionX = -directionX; 
     }
     y += speedY * directionY;
     if ((y > height-radius) || (y < radius)) 
     {
         directionY = -directionY; 
     }
     
   }
}
 
 
 
 
 
 
 
 
 
 
 
 
class AnimatedSprite
{
  int frameRow;
  int frameColumn;
  int frameWidth;
  int frameHeight;
  int startFrame;
  int endFrame;
  float currentFrame;
  boolean loop = true;
  float frameSpeed = 12.0;
  PImage spriteSheet;
  PImage img;
   
  AnimatedSprite(String filename, int widthOfOneFrame, int heightOfOneFrame)
  {
    this.spriteSheet = requestImage(filename);
    this.frameWidth = widthOfOneFrame;
    this.frameHeight = heightOfOneFrame;
  }
   
  void setAnimation(int start, int end, boolean looping)
  {
    if (start != this.startFrame || end != this.endFrame)
    {
      this.startFrame = start;
      this.endFrame = end;
      this.currentFrame = this.startFrame;
    } 
       
    this.loop = looping;
  }
   
  void draw()
  {
    if (this.spriteSheet.width <= 0)
    {
      return;
    }
    
    this.currentFrame += (this.frameSpeed / frameRate);
    if ((int)this.currentFrame > this.endFrame)
    {
      if (this.loop == true)
      {
        this.currentFrame = this.startFrame;
      }
      else
      {
        this.currentFrame = this.endFrame;
      }
    }
     
    int colCount = this.spriteSheet.width / this.frameWidth;
    this.frameColumn = (int)this.currentFrame ;
    if (colCount > 0)
    {
      this.frameColumn =(int)((int)this.currentFrame % colCount);
      this.frameRow = (int)(this.currentFrame / colCount);
    }
    this.img = this.spriteSheet.get(
      this.frameColumn * this.frameWidth,
      this.frameRow * this.frameHeight,
      this.frameWidth,
      this.frameHeight);
       
    image(this.img, 0, 0, frameWidth, frameHeight);
  }
}
  
  
  
  
  
  
  
  
  
 
class Cat
{
  float x = 0.0;
  float y = 0.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 2.0;
  float scaredAmount = 3;
  float hp = 100;
  AnimatedSprite sprite;
   
  Cat()
  {
    this.sprite = new AnimatedSprite("catsprite6.png", 32, 32);
  }
  
  void lookAt(float otherX, float otherY)
  {
    this.rotation = degrees(atan2(otherY-this.y, otherX-this.x));
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation));
  }
   
  void draw()
  {
    
    if (forwardKeyPressed)
    {
      this.directionX = 0;
      this.directionY = -1;
    }
    else if (backwardKeyPressed)
    {
      this.directionX = 0;
      this.directionY = 1;
    }
    else if (rightKeyPressed)
    {
      this.directionX = 1;
      this.directionY = 0;
    }
    else if (leftKeyPressed)
    {
      this.directionX = -1;
      this.directionY = 0;
    }
    else
    {
      this.directionX = 0;
      this.directionY = 0;  
      this.sprite.setAnimation(0, 0, false);
    }
    
    this.x += this.directionX * this.speed;
    this.y += this.directionY * this.speed;
   
    imageMode(CENTER);
    pushMatrix();
    translate(this.x, this.y);
    rotate(radians(this.rotation));
    scale(this.s);
    
    this.sprite.draw();
     
    popMatrix(); 
  } 
}
 
 



