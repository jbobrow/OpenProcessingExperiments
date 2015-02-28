
PImage troll;
PImage teemo;
int x = 1;
int dub = 1;



void setup()
{
    textSize(100);
  size(800,800);
  troll = loadImage("teemoshroom.jpg");
  teemo = loadImage("teamoo.png");
   image(troll,0,0,800,800);
}


void draw ()
{
  frameRate(1);
  
  image(troll,0,0,800,800);
  
  while(x<=dub)
  {
    image(teemo,random(800),random(800),100,100);
    x++;
  }
  if(x>900)
  {
     dub = 0
     x = 0
  }
  
  fill(45,185,43);
  text(dub,100,100);
  dub=dub*2;
}
    
    
  
  
  


