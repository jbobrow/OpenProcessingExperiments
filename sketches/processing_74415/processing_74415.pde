
PImage troll;
PImage teemo;

void setup()
{
  size(800,800);
  troll = loadImage("http://argentxorion.webs.com/misc/teemoshroom.jpg");
  teemo = loadImage("http://argentxorion.webs.com/misc/teamoo.png");
   image(troll,0,0,800,800);
}


void draw ()
{
  frameRate(8);
  
  int x = 1;
  
  image(troll,0,0,800,800);
  
  while(x<=100)
  {
    image(teemo,random(800),random(800),100,100);
    x++;
    
  }
   if(x>100);
   {
     x = 1;
   }
}
