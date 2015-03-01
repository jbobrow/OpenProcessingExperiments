
int x,y;
float r,g,b; 

void setup() 
{
size (400,400);
background (0);
}

void draw()
{
  fill(r,g,b);
  
 
  r=random(85);
  g=random(37);
  b=random(84);
  
  rect(x,y,width/10,height/10);
 x=x+width/10;
 y=y;
if((x>width))
{
x=0;
y=y+height/10;
}
}
