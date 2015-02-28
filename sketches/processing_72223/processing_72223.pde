
//Perry Phan, 4/5, Computer Programming, Ticklish Penguin
PImage b;
int x = 50;
int y = 0;
void setup()
{
  size(400,400);
  b=loadImage("randomwalk.jpg");
}
void draw()
{

  {
   image(b,x,y,300,300);
   
    x=x+int(random(-5,5));
    y=y+int(random(-5,5));
    
  }
}
