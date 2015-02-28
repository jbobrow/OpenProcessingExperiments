
/*
Black Fields
*/

Bubble[] b;
boolean d;

void setup()
{
  size(900,900);
  smooth();

  b = new Bubble[100];
  for(int i=0; i<100; i++)
  {
    b[i] = new Bubble();
    b[i].x = random(-width,width*2);
    b[i].y = random(-height,height*2);
    b[i].d = (int)random(1,90);
    b[i].v = (int)random(1,10);
    b[i].r = 0;
    b[i].g = 0;
    b[i].b = 0;
    
    if (i%10 == 0)
    {
     b[i].r = 255;
     b[i].g = 255;
     b[i].b = 255; 
     noStroke();
    }
    

  }
}

void draw()
{
  background(255,255,255);
  for(int i=0; i<b.length; i++)
  {
    b[i].move();
    b[i].show();
    
  /*    if (i > 100)
   {
     i = i--;
   }
  
  }
  
*/
}
}

class Bubble
{
  float x, y;
  int d, v,k;
  float r,g,b;
  float p,u,o;

  void show()
  {
    fill(r,g,b);
    stroke(p,u,o, d--);
    rect(x,y, d,d);
    

  }

  void move()
  {
    x += ( mouseX - width/2  ) * 0.01 * v;
   y += ( mouseY - height/2 ) * 0.01 * v;
   
    if (x < -5)
  {
    x = 900;
  }
  
   if (x > 905)
  {
    x = 0;
  }
   
   if (y < -5)
  {
    y = 900;
  }
  
     if (y > 905)
  {
    y = 00;
  }
   
/*    if (d > 50)
  {
    d = 50;
  }
  */ 
  }
}


