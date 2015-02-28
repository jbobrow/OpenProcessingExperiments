
/* @pjs preload= "Abstract.jpg, Cloud.jpg, Tree.jpg"; */

PImage img;
PImage img2;
PImage img3;
int y;
int x;
float X;
float Y;
float r = random(3);
float rr = random(3);

void setup()
{
  size(960,600);
  background(255);
  img = loadImage("Abstract.jpg");
  img2 = loadImage("Cloud.jpg");
  img3 = loadImage("Tree.jpg");    
}

void draw()
{
  image(img,0,0,960,600);
  tint(255,225);
  image(img2,0,0,960,200);
  image(img3,650,430);
  filter(INVERT);
  
 
  for(y = 0; y < 600; y = y + 50)
   {
     strokeWeight(r);
     line(0,y,960,y);
   }
  for(x = 0; x < 960; x = x + 50)
   {
     strokeWeight(rr);
     line(x,0,x,600);
   }
   
  X = 600;
  Y = 150;
  float prevX = X;
  float prevY = Y;
  while( X < 700)
  {
   X += 5;
   Y += random(-5, 33);
   stroke(13,41,216);
   strokeWeight(2);
   line(prevX,prevY,X,Y);
   prevX = X;
   prevY = Y;
  }
 
}


