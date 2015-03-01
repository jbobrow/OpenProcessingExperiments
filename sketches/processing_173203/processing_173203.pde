
int num = 50;
Rays[] rays_array = new Rays[num]; 
  
void setup()
{
  size (600,300);  
  for(int i=0; i<num; i++)
  {
    rays_array[i] = new Rays();    
  }
    
}
  
  
void draw()
{
 
  background(20);
  noStroke();
   
   
  for(int i=0; i<num; i++)
  {
   rays_array[i].update();
   rays_array[i].display();     
  }
  
}
   
  
  
class Rays
{
  float x,y, x1,y1, x2,y2, vx,vy, grav;
  float c1, c2, c3;
    
  Rays()
  {
   x = random(width);
   y = random(height);
   x1 = x1+10;
   y1 = y1+10;
   
   vx=random(-.5,.5);
   vy=random(-.5,.5);
   c1=random(0,200);
   c2=random(0,50);
   c3=random(0,200);
   grav=-.00001;  
  
  }
  
  void update()
  {
    x+=vx;
    y+=vy;
    vy+=grav;
    vx+=grav;

    fill(c1,c2,c3,50);
  }
    
  void display()
  {
      
    pushMatrix();
    triangle(x,y,x1,y1,x2,y2);
    translate(x, y);
    popMatrix();
      
  }

}

