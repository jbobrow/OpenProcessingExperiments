
//Stanley Situ

rain[] a, b;
int block;
PImage monk;
PImage metro;
PImage metropo;
PImage rain;
  float left = 0, right = 0;
  float l = 800, r = 0;

void setup()
{
  size(500,300);


  monk = loadImage("cartoon_monk.gif");
  metro = loadImage("metro.gif");  
  metropo = loadImage("metropo.gif");
  rain = loadImage("Rain.gif");
  
  a = new rain[150];
  for(int i=0; i<150; i++)
  {
  a[i] = new rain();    
  a[i].x = random(width);
  a[i].y = random(height);
  a[i].d = 2;
  a[i].dd = 5;
  }
  
  b = new rain[10];
  for(int j=0; j<10; j++)
  {
  b[j] = new rain();    
  b[j].X = random(-100,width+100);
  b[j].Y = random(height/8);
  b[j].tall = random(60,150);
  b[j].lonq = random(20,60);
  }
  
}

void draw()
{  
  
  image(metro, left,right);
  image(metropo, l,r);
  
       left -= 100;
     if (left < -800)
     {left = 700;}
    
     l -= 100; 
     if (l < -800)
     {l = 700;}
     
  for(int i=0; i<a.length; i++)
  {
  a[i].show();
  a[i].move();
  }

  for(int j=0; j<b.length; j++)
{  
  b[j].show();
  b[j].move();
}

  fill(100,100);
  rect(0,0, width,height);
 }


class rain
{
  float x, y;
  float X, Y;
  float left = 0, right = 0;
  float l = 800, r = 0;
  float mX=width/2 , mY=height/1.3;
  float tall, lonq;
  float d, dd;
    
    void show()
    {
      image(monk, mX,mY);
 
// RAIN 
      fill (80,110,107);  noStroke();
      for (int i=0; i<width; i+=4) 
      {
        ellipse(x,y, d,dd);
      }      
    }
    
    void move()
    {
     x -= 10;
    if (x < 0)
     { x = width; } 
      
     y += 10;
     if (y > random(height/1.15,height))
     { y=0; }
         
     X -= 50;
      if (X < 0)
      { X = width; }
      
    }
}





