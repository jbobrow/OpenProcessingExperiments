
float counter=0;

void setup()
{
  size(500,500,P2D);
  frameRate(60);
}

void draw()
{
  background(255);
  
 
  
  translate(width/2,height/2);
  
  float deg = counter;
  
  
  for(int i=0;i<36;i++)
  {
    line(1*cos(radians(deg)),1*sin(radians(deg)),50*cos(radians(deg+40)),50*sin(radians(deg+40)));
    line(50*cos(radians(-deg)),50*sin(radians(-deg)),100*cos(radians(-(deg+20))),100*sin(radians(-(deg+20))));
    line(100*cos(radians(deg)),100*sin(radians(deg)),150*cos(radians(deg+10)),150*sin(radians(deg+10)));
    line(150*cos(radians(-deg)),150*sin(radians(-deg)),200*cos(radians(-(deg+10))),200*sin(radians(-(deg+10))));
    deg+=10;
   
  }
  
  
  counter+=0.1;
 
  
  
  

  
}
 
  
  

  
  

