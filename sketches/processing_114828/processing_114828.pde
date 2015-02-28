
SpriteObject[] mysprites= new SpriteObject[20];
int currentsprite=0;
float timer=1;
boolean click=false; 
boolean click2=false;
void setup()
{
  size(500,500);
  frameRate(1);
  mysprites[0]=new SpriteObject("title.png");
  mysprites[1]=new SpriteObject("house.png");
  mysprites[2]=new SpriteObject("story1.png");
  mysprites[3]=new SpriteObject("freezer.png");
  mysprites[4]=new SpriteObject("story2.png");
  mysprites[5]=new SpriteObject("ate.png");
  mysprites[6]=new SpriteObject("storya1.png");
  mysprites[7]=new SpriteObject("bathroom.png");
  mysprites[8]=new SpriteObject("storya2.png");
  mysprites[9]=new SpriteObject("Gas.jpg");
  mysprites[10]=new SpriteObject("storya3.png");
  mysprites[11]=new SpriteObject("fire.png");
  mysprites[12]=new SpriteObject("storyfinal.png");
  mysprites[13]=new SpriteObject("storyb1.png");
  mysprites[14]=new SpriteObject("walmart.png");
  mysprites[15]=new SpriteObject("storyb2.png");
  mysprites[16]=new SpriteObject("icecream.jpg");
  mysprites[17]=new SpriteObject("storyb3.png");
  mysprites[18]=new SpriteObject("mess.png");
  mysprites[19]=new SpriteObject("jail.png");
  
  for (int i = 0; i < 20; i++)
  {
    mysprites[i].w = width;
  }
  for (int i = 0; i < 20; i++)
  {
    mysprites[i].h = height;
  }
  for (int i = 0; i < 20; i++)
  {
    mysprites[i].y = height/ 2;
  }
  for (int i = 0; i < 20; i++)
  {
    mysprites[i].x = width / 2;
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
void draw()
{
  //println(mouseX);
  //println(mouseY);
  println(timer);
if(timer>0 && timer<7)
{
  mysprites[0].render();
  timer+=1;
  strokeWeight(3);
  for(int a=0;a<100;a+=10)
  {
    for(int b=0;b<500;b+=10)
    {
      point(a,b);
    }
  }
}
if(timer>6 && timer<15)
{
  mysprites[1].render();
  timer+=1;
}
if(timer>14 && timer<20)
{
  mysprites[2].render();
  timer+=1;
   strokeWeight(4);
  for(int a=100;a<200;a+=10)
  {
    for(int b=0;b<500;b+=10)
    {
      point(a,b);
    }
  }
}
if(timer>19 && timer<24)
{
  mysprites[3].render();
  timer+=1;
}
if(timer>23 && timer<29)
{
  mysprites[4].render();
  timer+=1;
   strokeWeight(3);
  for(int a=200;a<300;a+=10)
  {
    for(int b=0;b<500;b+=10)
    {
      point(a,b);
    }
  }
}
if(timer>28 && timer<30)
{
  mysprites[5].render();
  timer+=1;
}
if(timer>79 && timer<84)
{
  mysprites[6].render();
  timer+=1;
   strokeWeight(3);
  for(int a=300;a<400;a+=10)
  {
    for(int b=0;b<500;b+=10)
    {
      point(a,b);
    }
  }
  }
if(timer>83 && timer<89)
{
  mysprites[7].render();
  timer+=1;
}
if(timer>88 && timer<94)
{
  mysprites[9].render();
  timer+=1;
}
if(timer>93 && timer<99)
{
  mysprites[10].render();
  timer+=1;
   strokeWeight(3);
  for(int a=400;a<500;a+=10)
  {
    for(int b=0;b<500;b+=10)
    {
      point(a,b);
    }
  }
}
if(timer>98&& timer<104)
{
  mysprites[11].render();
  timer+=1;
}
if(timer>103 && timer<109)
{
  mysprites[12].render();
  timer+=1;
   strokeWeight(3);
  for(int a=0;a<500;a+=10)
  {
    for(int b=0;b<500;b+=10)
    {
      point(a,b);
    }
  }
}
if(timer>108 && timer<500)
{
  mysprites[19].render();
  timer+=0;
}
if(timer>499 && timer<506)
{
  mysprites[13].render();
   timer+=1;
    strokeWeight(3);
  for(int a=300;a<400;a+=10)
  {
    for(int b=0;b<500;b+=10)
    {
      point(a,b);
    }
  }
}
if(timer>505 && timer<511)
{
  mysprites[14].render();
   timer+=1;
}
if(timer>510 && timer<515)
{
  mysprites[15].render();
   timer+=1;
    strokeWeight(3);
  for(int a=400;a<500;a+=10)
  {
    for(int b=0;b<500;b+=10)
    {
      point(a,b);
    }
  }
}
if(timer>514 && timer<520)
{
  mysprites[16].render();
   timer+=1;
}
if(timer>519 && timer<524)
{
  mysprites[17].render();
   timer+=1;
    strokeWeight(3);
  for(int a=0;a<250;a+=10)
  {
    for(int b=0;b<500;b+=10)
    {
      point(a,b);
    }
  }
}
if(timer>523 && timer<529)
{
  mysprites[18].render();
   timer+=1;
}
if (timer>528 && timer<533)
{
  mysprites[12].render();
  timer+=1;
   strokeWeight(3);
  for(int a=0;a<500;a+=10)
  {
    for(int b=0;b<500;b+=10)
    {
      point(a,b);
    }
  }
}
if(timer>532)
{
  mysprites[19].render();
}

}
void keyPressed()
{
  if(key=='l')
  {
    timer+=50;
  }
  if (key=='r')
  {
    timer+=470;
  }
}
void keyReleased()
{
  if(key=='l')
  {
    timer+=1;
  }
  if(key=='r')
  {
    timer+=1;
  }
}
void mousePressed()
{
  if(click==false && mouseX>317 && mouseX<496 && mouseY>399 & mouseY<489)
  {
    click=true;
    timer+=470;
  }
 if (click2==false && mouseX>7 &&mouseX<185 && mouseY>392 &&mouseY<487)
 {
   click2=true;
   timer+=50;
 }
}


