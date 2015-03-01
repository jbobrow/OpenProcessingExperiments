

void setup()
{
  size(700,700);
  background(0);
  stroke(255,255,255);
  fill(0,255,0);
  
};

void draw()
{
  dr(100,25);
  dr(100,225);
  dr(100,425);
};


void dr(int x,int y)
{
   rect(150+x,150+y,150,30);
   triangle(150+x,150+y,150+x,75+y,180+x,150+y);
   triangle(150+x,180+y,180+x,180+y,150+x,255+y);
   triangle(300+x,150+y,330+x,165+y,300+x,180+y);
};




