
//Michael H CP1 16-17
//Ticklish Penguin 
int x=250;

int y=400;
PImage b;
PImage c;

void setup()
{
  size(1000,1000);
  c=loadImage("http://michaelair123.webs.com/mcdonalds-big-mac.jpg");
  b= loadImage("http://michaelair123.webs.com/physical-effects-of-childhood-obesity.jpg");     
}

void draw()
{
  stroke(0,255,0);
  fill(255,0,0);
  if(mousePressed==true)
  {
    background(0);
    image(b,x,y,410,210);
  x=x+int(random(-12,12));
  y=y+int(random(-12,12));
  }
  else 
  {
    background(255,255,255);
image(c,350,350,300,350);
  }
}  
  
