
PImage b;
int x=150;
int y=150;
void setup()
{
  size(500,500);
  b=loadImage("Bunny.jpg");
}
void draw()
{
  background(255);
  image(b,x,y,200,200);
  if(mousePressed==true){ 
    x=x+(int)random(-7,7);
    y=y+(int)random(-7,7);
  }
  } 



