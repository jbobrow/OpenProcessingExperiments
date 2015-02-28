
//KYLE LLESES
//PS4-1

PFont font;
int x,y;
int z;
PImage a;

void setup()
{
  size(1200,400);
  background(0);
  font = loadFont("Captureit-48.vlw");
  x=310;
  y=310;
  z=20;
  a = loadImage("shock.jpg");

}

 
void draw()
{
  
  image(a, 0, 0);
      
  //Text trail
  
  fill(255,0,0,50);
  textSize(200);
  text("SURPRISE", x-10,y);
  fill(255,0,0,30);
  text("SURPRISE", x-20,y);
  fill(255,0,0,30);
  text("SURPRISE", x-30,y);
  fill(255,0,0,20);
  text("SURPRISE", x-40,y);
  fill(255,0,0,10);
  text("SURPRISE", x-50,y);
  fill(255,0,0,10);
  text("SURPRISE", x-60,y);
  fill(255,0,0,10);
  text("SURPRISE", x-70,y);
  fill(255,0,0,10);
  text("SURPRISE", x-80,y);
 
  fill(255,234,0);
  textSize(200);
  text("SURPRISE", x,y);
  
  //move
   x=x+5;
 
  if(x<300)
  {
    x=x+z;
  }
  else if(x>300 && x>600)
  {
    x=-600;
  }
 

}

