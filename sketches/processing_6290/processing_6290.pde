
/*
Massive scale is always better when done by Theresa Caasi Davis
 */

Ripple b, c;

void setup()
{
  size(999,999);
  background(0,191,255, 100); 
  smooth();
  b = new Ripple();
}

void draw()
{
  noFill();
  
  b.x = random(width);
  b.y = random(height);
  b.z = 10;
  b.v = width/75;
  b.w = width/120;
  b.d= 100;
  b.p = 255;
  b.u = 255;
  b.o= 255;
  b.show(); 

}


class Ripple 
{
  float x, y, z,w,v,d ;
  float p,u,o;

  void show()
  {
    
    for(int i=0; i<10; i++)
    {
      stroke(p,u,o, d--);
      ellipse(x, y, z,z);
      z += 10;
      d -= 20;
    }
    
  }
}
  
  


  
  


