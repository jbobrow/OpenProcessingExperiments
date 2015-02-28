
float x=250;
float y=250;
float gx=4;
float gy=4;
float radius=50;
 PImage b;
 
void setup()

{
  size (638,360);
  b = loadImage("mond2.jpg");
}

void draw()
{
 
image(b, 0, 0,width,height);
  x=x+gx;
  y=y+gy;
  
  if(x>width-radius) 
  {
    
   gx=-gx;
   //gx=gx+random(-0.1,0.1);
   x =width-radius;
   
  }
  if (x<radius)
  {
    gx=-gx;
    //gx=gx+random(-0.1,0.1);
    x = radius;
  }
   if(y>height-radius) 
  {
   gy=-gy;
  // gy = gy * 0.9;
   y = height-radius;
  }
  
  if (y<radius)
  {
    gy=-gy;
    y = 0;
  }
 
  fill(255,0,0);
  ellipse(x,y,radius*2,radius*2);
  
 gy = gy + 0.1;


  
}

