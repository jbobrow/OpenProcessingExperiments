
float angle=0;
void setup()
{
size(800,480);
 
}
 
void draw()
{
  background(0);
  float sinval = sin(angle);
  float sinpositive;
   
   
  float y = (sinval+1)*height/2;
   
  float r = (sinval+1)*128;
  float g = (1 - sinval)*128;
  
  fill(r,g,0);
  
 for (int i=0; i<8; i+=1)
{
  
  ellipse((i+1)*(width/8),height/2*(1-(sin(angle+((i+1)*PI/8)))),50,50*sinval);
 
 
}
   fill(0,0,255);
  int i=3;
   ellipse((i+1)*(width/8),height/2*(1-(sin(angle+((i+1)*PI/8)))),50,50*sinval);
  
  
   
   
 
angle +=0.1;
  
 
}
 
void mouseDragged()
{
 
}

