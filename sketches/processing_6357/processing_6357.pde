
Ray[] a;

void setup()
{
  size(600,600);
  smooth();
  stroke(255,255,0);
  

  a = new Ray[200];
  for(int i=0; i<200; i++)
  {
    a[i] = new Ray();
    a[i].x = random(-width,width*2);
    a[i].y = random(-height,height*2);
    a[i].m = (int)random(14,80);
    a[i].z = (int)random(7,10);
   
  }
}

void draw()
{
  background(50);
  for(int i=0; i<a.length; i++)
  {
    a[i].move();
    a[i].show();
    
  }
}

class Ray
{
  float x, y;
  float m, z; 
  
 

  void show()
  {
    line(x,y, m,m);

  }

  void move()
  {
    x += ( mouseX - width/2  )* 0.010 * z;
    y += ( mouseY - height/2 )* 0.010 * z;
  }
}


