
float a,b,c;
int x,y;

void setup()
{
   size(1000,1000);
   background(#000500);
}

void draw()
{
  
  fill(a,b,c);
a=random(247);
b=random(132);
c=random(246);

  rect(x,y,width/8,height/8);
  x=x+width/8;
  y=y;
  
 if (x>=width){
   x=0;
   y=y+height/8;}
   
}
