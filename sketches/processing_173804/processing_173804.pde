
float x,y;

void setup()
{
  size(800,600);
  background(254);
  x=width/2;
  y=height/2;
  
  }
  
  void draw()
  {
    point(x,y);
    strokeWeight(4);
    stroke(233,2,1);
    x=x + random(0.1,2);
    y=y + random(0.2,1);
    if((x>width)||(y>height))// se le coordinate escono dal canvas
    {
      stroke(random(132),random(254),random(200));
      x=random(7,width);
      y=random(1,height);
      
    } 
      
      
    
  }
