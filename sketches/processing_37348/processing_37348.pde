
//homework5
//copyright Joel McCullough Pittsburgh,PA 15221
int w,r,g,b,x1,y1,x2,y2;

void setup()
{
  size(400,400);
  smooth();
   background(48,43,47);
   strokeWeight(7);
}

void draw()
{

   w = 255;
   r = 181; 
   g = 88;
   b = 17;
   x1=100;
   y1=100;
   x2=300;
   y2=300;
  while(w >=0)
  {
    
    if(x1 == 100)
    {
    stroke(255,166,0);
    fill(r,g,g);
    ellipse(x1,y1,w-10,w-10);
    r = r-20; 
    }
    if(x2 == 300)
    {
    stroke(84,177,181);
    fill(w);
    ellipse(x2,y1,w-10,w-10);
    w = w-10; 
    }
    if(x2 == x2)
    {
      stroke(255,166,0);
      fill(w);
      ellipse(x1+200,y2,w-10,w-10);
      w = w-10; 
    }
    if(x1 == x1)
    {
    stroke(255,166,0);
    fill(r,b,b);
    ellipse(x1,y2,w-10,w-10);
    r=r-10; 
    }
    if(x1==x1+200)
     {
    stroke(84,177,181);
    fill(w-30);
    ellipse(x1+200,y2,w-10,w-10);
    w = w-10; 
    }
    if(x1==x1)
     {
    stroke(84,177,181);
    fill(w-30);
    ellipse(x1,y2,w-10,w-10);
    w = w-10; 
    }
  }
      
}
