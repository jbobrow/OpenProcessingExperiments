
int x;
int y;
int velocitatX;
int velocitatY;
void setup()
{
  size(300,300);
  background(0);
  
  x=int(random(1,width));
  y=int(random(1,height));
  
  velocitatX=4;
  velocitatY=5;
  
}
void draw()
{
  background(0);
  ellipse(x,y,20,20);
  
  x=x+velocitatX;
  y=y+velocitatY;
  
  if((x<20)||(x>width-20))
  {
    velocitatX=-velocitatX;
  }
  
  if((y<20)||(y>height-20))
  {
    velocitatY=-velocitatY;
  }
  
    
  
}
