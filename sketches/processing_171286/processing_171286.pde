
int num = 300;
Triangle[] triangle_array = new Triangle[num];
 
 
void setup()
{
  size (600,600);
   
  for(int i=0; i<num; i++)
  {
    triangle_array[i] = new Triangle();
     
  }
   
}
 
 
void draw()
{

  background(255);
  noStroke(); 
  
  
  for(int i=0; i<num; i++)
  {
   triangle_array[i].update();
   triangle_array[i].display();
     
  }
 
}
 
void mouseReleased()
{
  for(int i=0; i<num; i++)
  {
   triangle_array[i].reset();
    
  }
 
}
 
 
 
class Triangle
{
  float x, y, x1, y1, x2, y2, vx, vy, grav;
  float bounciness;
  float v1, v2, v3;
   
  Triangle()
  {
   x = random (width);
   y = random (height);
   x1 = x+5;
   y1 = y+5;
   x2 = x1+5;
   y2 = y1+5;
   bounciness = random(-.95,-.5);
   vx = random(-3,3);
   vy = random(-3,3);
   v1 = random(0,255);
   v2 = random(0,255);
   v3 = random(0,255);
   grav = -.00015;   
 
  }
  void update()
  {
    vy+=grav;
    vx+=grav;
    x+= vx;
    y+= vy;
 
  if (y>height)
  {
    y = height;
    vy *= bounciness;
  }
 
  if (x<0)
  {
    x= 0;
    vx*= bounciness;
  }
 
  if (x>width)
  {
    x = width;
    vx*= bounciness;
  }
   
  if (y<0)
  {
    y = 0;
    vy*= bounciness;
  }
    
    if (y1>height)
  {
    y1 = height;
    vy *= bounciness;
  }
 
  if (x1<0)
  {
    x1= 0;
    vx*= bounciness;
  }
 
  if (x1>width)
  {
    x1 = width;
    vx*= bounciness;
  }
   
  if (y1<0)
  {
    y1 = 0;
    vy*= bounciness;
  }
    if (y2>height)
  {
    y2 = height;
    vy *= bounciness;
  }
 
  if (x2<0)
  {
    x2= 0;
    vx*= bounciness;
  }
 
  if (x2>width)
  {
    x2 = width;
    vx*= bounciness;
  }
   
  if (y2<0)
  {
    y2 = 0;
    vy*= bounciness;
  }
  fill(v1,v2,v3,120);
  }
   
  void display()
  {
     
    pushMatrix();
    triangle(x,y,x1,y1,x2,y2);
    translate(x, y);
    popMatrix();
     
  }
   
  void reset()
  {
   x = mouseX;
   y = mouseY;
   vx = random(-3,3);
   vy = random(-3,3);
  }
   
}
