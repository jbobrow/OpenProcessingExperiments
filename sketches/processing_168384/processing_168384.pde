
float r;
float g;
float b;

String f;

int y=0;
int x=0;
void setup()
{
  size(300,300);
  background(0);
}
 void draw()
 {
   r=random(255);
   g=random(255);
   b=random(255);

 
   stroke(r,g,b);
   fill(r,g,b);
   rect(x,y,10,10);
  
  x=x+10;
  
  if (x==width)
  {
   y=y+10;
   
   x=0;
   
  }
   
   
 }
