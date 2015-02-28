
int x,y,velocitatX,velocitatY;


void setup()
{
  size(500,500);
  
  x = width/2;
  y = height/2;
  velocitatX = int(random(2,10));
  velocitatY = int(random(2,10));

}

void draw(){
  background(80);
  noStroke();
  
  
  x += velocitatX;
  y += velocitatY;
  
  
  ellipse(x,y,40,40);
  if((x<20)||(x>width-20))
  {
    velocitatX = -velocitatX;
  } 
  
  if((y<20)||(y>height-20))
  {
    velocitatY = -velocitatY;
  } 

}
