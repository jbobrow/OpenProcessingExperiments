
void setup()

{
  size(500,500);
}

void draw()
{
  background(156,160,142);
  for (int i=0;i<500;i=i+10)
  {
   boopBoop(i,i);
    }
}

void boopBoop(int x, int y)
{
   if (x<350)
    {
    float a=random(140);
    float b=random(80);
    float c=random(100);
    float opacity=random(100);
    noStroke();
    fill(a,b,c,opacity);
    ellipse(x/2+x,y/2+y,x,y);
    
    float f=random(100);
    float d=random(200);
    float e=random(140);
    float opacity1=random(50);
    
    float g=random(500);
    
    stroke(f,d,e,opacity1);
    line(0,500,g,g);
    line(500,0,g,g);
    frameRate(15);
    }
}
