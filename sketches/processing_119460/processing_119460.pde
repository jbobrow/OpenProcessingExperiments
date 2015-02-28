
SpriteObject[] textsprites=new SpriteObject[20];
float timer=0;
PFont times;
float trans=255;
void setup()
{
  times=createFont("Times New Roman",12);
  size(500,500);
  
    //left side inner
  textsprites[0]=new SpriteObject("Caring.png");
  textsprites[0].x=0;
  textsprites[0].y=50;
  textsprites[0].directionX=random(1,2);
  textsprites[0].directionY=random(1,2);
  textsprites[0].speed=3;
  textsprites[0].rotation=random(0,359);
  textsprites[1]=new SpriteObject("Kind.png");
    textsprites[1].x=0;
  textsprites[1].y=100;
  textsprites[1].directionX=random(1,2);
  textsprites[1].directionY=random(1,2);
  textsprites[1].speed=3;
  textsprites[1].rotation=random(0,359);
  textsprites[2]=new SpriteObject("Philosopher.png");
    textsprites[2].x=0;
  textsprites[2].y=150;
  textsprites[2].directionX=random(1,2);
  textsprites[2].directionY=random(1,2);
  textsprites[2].speed=3;
  textsprites[2].rotation=random(0,359);
  textsprites[3]=new SpriteObject("Thoughtful.png");
    textsprites[3].x=0;
  textsprites[3].y=200;
  textsprites[3].directionX=random(1,2);
  textsprites[3].directionY=random(1,2);
  textsprites[3].speed=3;
  textsprites[3].rotation=random(0,359);
  textsprites[4]=new SpriteObject("Inteligent.png");
    textsprites[4].x=0;
  textsprites[4].y=250;
  textsprites[4].directionX=random(1,2);
  textsprites[4].directionY=random(1,2);
  textsprites[4].speed=3;
  textsprites[4].rotation=random(0,359);
  textsprites[5]=new SpriteObject("Caring.png");
    textsprites[5].x=0;
  textsprites[5].y=300;
  textsprites[5].directionX=random(1,2);
  textsprites[5].directionY=random(1,2);
  textsprites[5].speed=3;
  textsprites[5].rotation=random(0,359);
  textsprites[6]=new SpriteObject("Kind.png");
    textsprites[6].x=0;
  textsprites[6].y=350;
  textsprites[6].directionX=random(1,2);
  textsprites[6].directionY=random(1,2);
  textsprites[6].speed=3;
  textsprites[6].rotation=random(0,359);
  textsprites[7]=new SpriteObject("Philosopher.png");
    textsprites[7].x=0;
  textsprites[7].y=400;
  textsprites[7].directionX=random(1,2);
  textsprites[7].directionY=random(1,2);
  textsprites[7].speed=3;
  textsprites[7].rotation=random(0,359);
  textsprites[8]=new SpriteObject("Thoughtful.png");
    textsprites[8].x=0;
  textsprites[8].y=500;
  textsprites[8].directionX=random(1,2);
  textsprites[8].directionY=random(1,2);
  textsprites[8].speed=3;
  textsprites[8].rotation=random(0,359);
  textsprites[9]=new SpriteObject("Inteligent.png");
    textsprites[9].x=0;
  textsprites[9].y=0;
  textsprites[9].directionX=random(1,2);
  textsprites[9].directionY=random(1,2);
  textsprites[9].speed=3;
  textsprites[9].rotation=random(0,359);
  //right side outer
  textsprites[10]=new SpriteObject("Gamer.png");
    textsprites[10].x=500;
    
  textsprites[10].y=0;
  textsprites[10].directionX=random(-1,-2);
  textsprites[10].directionY=random(-1,-2);
  textsprites[10].speed=3;
  textsprites[10].rotation=random(0,359);
  textsprites[11]=new SpriteObject("ShutIn.png");
    textsprites[11].x=500;
  textsprites[11].y=50;
  textsprites[11].directionX=random(-1,-2);
  textsprites[11].directionY=random(-1,-2);
  textsprites[11].speed=3;
  textsprites[11].rotation=random(0,359);
  textsprites[12]=new SpriteObject("Weird.png");
    textsprites[12].x=500;
  textsprites[12].y=100;
  textsprites[12].directionX=random(-1,-2);
  textsprites[12].directionY=random(-1,-2);
  textsprites[12].speed=3;
  textsprites[12].rotation=random(0,359);
  textsprites[13]=new SpriteObject("Nerd.png");
    textsprites[13].x=500;
  textsprites[13].y=150;
  textsprites[13].directionX=random(-1,-2);
  textsprites[13].directionY=random(-1,-2);
  textsprites[13].speed=3;
  textsprites[13].rotation=random(0,359);
  textsprites[14]=new SpriteObject("LongHair.png");
    textsprites[14].x=500;
  textsprites[14].y=200;
  textsprites[14].directionX=random(-1,-2);
  textsprites[14].directionY=random(-1,-2);
  textsprites[14].speed=3;
  textsprites[14].rotation=random(0,359);
  textsprites[15]=new SpriteObject("Gamer.png");
    textsprites[15].x=500;
  textsprites[15].y=250;
  textsprites[15].directionX=random(-1,-2);
  textsprites[15].directionY=random(-1,-2);
  textsprites[15].speed=3;
  textsprites[15].rotation=random(0,359);
  textsprites[16]=new SpriteObject("ShutIn.png");
    textsprites[16].x=500;
  textsprites[16].y=300;
  textsprites[16].directionX=random(-1,-2);
  textsprites[16].directionY=random(-1,-2);
  textsprites[16].speed=3;
  textsprites[16].rotation=random(0,359);
  textsprites[17]=new SpriteObject("Weird.png");
    textsprites[17].x=500;
  textsprites[17].y=350;
  textsprites[17].directionX=random(-1,-2);
  textsprites[17].directionY=random(-1,-2);
  textsprites[17].speed=3;
  textsprites[17].rotation=random(0,359);
  textsprites[18]=new SpriteObject("Nerd.png");
    textsprites[18].x=500;
  textsprites[18].y=400;
  textsprites[18].directionX=random(-1,-2);
  textsprites[18].directionY=random(-1,-2);
  textsprites[18].speed=3;
  textsprites[18].rotation=random(0,359);
  textsprites[19]=new SpriteObject("LongHair.png");
    textsprites[19].x=500;
  textsprites[19].y=450;
  textsprites[19].directionX=random(-1,-2);
  textsprites[19].directionY=random(-1,-2);
  textsprites[19].speed=3;
  textsprites[19].rotation=random(0,359);
}
void draw()
{
  println(timer); //8.5 seconds till all faded
  timer+=0.0167;
  background(255);
  //fill(0);
  textSize(12);
  textFont(times);
if(timer>0)
{
  fill(0,0,0,trans);
  //concrete text here
  text("Gamer",107,101);
  text("Do a quest",93,123);
  text("Save the world. Find 6 bear claws. Help the man",84,141);
  text("WASD Joystick D-Pad Arrow Keys Action Bars",74,154);
  text("Games",304,104);
  text("Weapons",301,117);
  text("Princess Captured Storm the Castle Beat the Dragon",69,174);
  text("Shoot the player, String the bow, Cast a spell to win",67,190);
  text("Swords, Knights, Dragons, Devils, Demons, Angels",70,210);
  text("Things of nightmares, Things of joy, Things of dreams",72,231);
  text("Friendly communitees, hateful players wanting revenge",66,246);
  text("Fight the boss, win/lose",68,262);
  text("Turn in the",68,279);
  text("quest, claim",66,295);
  text("the reward.",63,314);
  text("Game is",67,331);
  text("over",80,347);
  text("Faires, Unicorns, and",257,265);
  text("others, aid a",312,283);
  text("hero on thier",314,295);
  text("quest to sieze",322,313);
  text("the day and",328,328);
  text("win now",337,345);
}
  
if (timer>15 && timer<28)
{
  trans-=1;
textsprites[0].alpha -= 0.3;
textsprites[1].alpha -= 0.3;
textsprites[2].alpha -= 0.3;
textsprites[3].alpha -= 0.3;
textsprites[4].alpha -= 0.3;
textsprites[5].alpha -= 0.3;
textsprites[6].alpha -= 0.3;
textsprites[7].alpha -= 0.3;
textsprites[8].alpha -= 0.3;
textsprites[9].alpha -= 0.3;
textsprites[0].update();
textsprites[0].render();
textsprites[1].update();
textsprites[1].render();
textsprites[2].update();
textsprites[2].render();
textsprites[3].update();
textsprites[3].render();
textsprites[4].update();
textsprites[4].render();
textsprites[5].update();
textsprites[5].render();
textsprites[6].update();
textsprites[6].render();
textsprites[7].update();
textsprites[7].render();
textsprites[8].update();
textsprites[8].render();
textsprites[9].update();
textsprites[9].render();
}
if (timer>28)
{
  textsprites[10].alpha-=0.3;
  textsprites[11].alpha-=0.3;
  textsprites[12].alpha-=0.3;
  textsprites[13].alpha-=0.3;
  textsprites[14].alpha-=0.3;
  textsprites[15].alpha-=0.3;
  textsprites[16].alpha-=0.3;
  textsprites[17].alpha-=0.3;
  textsprites[18].alpha-=0.3;
  textsprites[19].alpha-=0.3;
  textsprites[10].update();
  textsprites[10].render();
  textsprites[11].update();
  textsprites[11].render();
  textsprites[12].update();
  textsprites[12].render();
  textsprites[13].update();
  textsprites[13].render();
  textsprites[14].update();
  textsprites[14].render();
  textsprites[15].update();
  textsprites[15].render();
  textsprites[16].update();
  textsprites[16].render();
  textsprites[17].update();
  textsprites[17].render();
  textsprites[18].update();
  textsprites[18].render();
  textsprites[19].update();
  textsprites[19].render();
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
  float alpha = 255;
     
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
      tint(255, 255, 255, this.alpha);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
      tint(255);
    }
  }
}




