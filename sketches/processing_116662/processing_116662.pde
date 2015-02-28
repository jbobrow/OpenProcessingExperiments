
SpriteObject man;
float rectx[]= {
  25, 150, 380, 597
};
float recty[]= {
  125, 150, 280, 230
};
float rectyadd=5;
float manx=275;
float many=400;
float r=250, g=250, b=250, countRed=11, countGreen=7, countBlue=9;

void setup()
{
  size(800, 600);
  background(255);
  strokeWeight(10);
  man = new SpriteObject("stickman.png","stickman2.png","crushed.png","crushed2.png");
  man.x = 275;
  man.y = 400;
}

void draw()
{
  //background(b, r, g);
  stroke(g, b, r);
  fill(r, g, b);
  r+=countRed;
  g+=countGreen;
  b+=countBlue;
  if (r>=255)
  {
    countRed*=-1;
  }
  if (r<=0)
  {
    countRed*=-1;
  }
  if (g>=255)
  {
    countGreen*=-1;
  }
  if (g<=0)
  {
    countGreen*=-1;
  }
  if (b>=255)
  {
    countBlue*=-1;
  }
  if (b<=0)
  {
    countBlue*=-1;
  }
  if(man.isOverlapping()==true)
  {
    man.img=requestImage("crushed.png");
  }
  man.render();
  rect(rectx[0], recty[0], 50, 50);
  rect(rectx[1], recty[1], 50, 50);
  rect(rectx[2], recty[2], 50, 50);
  rect(rectx[3], recty[3], 50, 50);
  for(int counter=0;counter<4;counter++)
  {
    recty[counter]+=rectyadd;
    if(recty[counter]>=600)
    {
      rectyadd*=-1;
    }
    if(recty[counter]<=000)
    {
      rectyadd*=-1;
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
  float s = 1.0;
  PImage img;
  boolean loaded = false;
 
  boolean isOverlappingMouse()
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
   
  boolean isOverlapping()
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
     
    float otherLeft = rectx[2];
    float otherRight = rectx[2]+50;
    float otherTop = recty[2];
    float otherBottom = recty[2]+50;   
     
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
 
  SpriteObject(String filename1, String filename2, String filename3, String filename4)
  {
    this.img = requestImage(filename1);
  }
    
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      this.w = 50;
      this.h = 200;
    }
    if(keyCode==RIGHT)
    {
      this.x+=10;
    }
    if(keyCode==LEFT)
    {
      this.x-=10;
    }
    if (loaded)
    {
      //imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      //rotate(radians(this.rotation));
      //scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}



