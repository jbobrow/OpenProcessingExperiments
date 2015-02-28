
//Derek Miu's emergent behavior 


color c1 = color(255,255,0);
man[] a;

void setup()
{
  size (1400,250);
  background (10,80,200);
  noStroke();
  

  
  a = new man[100];
  for(int i=0; i<100; i++)
  {
    color c1;
    a[i] = new man();
    a[i].x = random( 0, width);
    a[i].y = random( 175, height);
    a[i].v = (int) random( 4,10);
    a[i].s = 25;
}
}

void draw ()
{
  background (10,80,200);
  noStroke();
  fill(0,205,0);
  rect(0,170,width,80);
  
  for(int i=0; i<100; i++)
  {
    a[i].show();
    a[i].move();
    
  }
}

//image(buff,x,y);

class man
{
  float x,y;
  int v,s;

 
  void show()
  {
    fill(c1);
    noStroke();
    ellipse(x,y,s,s); 
    stroke (0);
    strokeWeight (3);
    line (x-4.5,y-5, x-4.5,y);
    line (x+4.5,y-4, x+4.5,y);
    strokeWeight (2);
    ellipse(x+2.5,y+5,5,2.5);
  }
  
   void move ()
   {
   
      if (keyPressed && key =='w')
      {
        y = y - v/2;
      }
      
      if (keyPressed &&key =='s')
      {
        y = y + v/2;
      }
       
      if (keyPressed && key =='a')
      {
        x = x - v;
        y = y + random(-1,1);
      }
      
      if (keyPressed && key =='d')
      {
        x = x + v;
        y = y + random(-1,1);
      }
       
      //borders 
      if (y <=155)
      {
        y = 165;
      }
      
      if (y >=255)
      {
        y = 254;
      }
       
      if (x >=width + s)
      {
        x = 0;
      }
      
      if (x <= -s )
      {
        x = width;
      }
   }
}

