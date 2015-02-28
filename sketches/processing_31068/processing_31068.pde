
float x = 0;
float y = 0;
float z = 0;
float c = 0;
void setup()
{
  background((color)255,255,255);
  size(500,500);
}
void draw()
{
background((color)0,100,225);
 y=y+4;
 x=x+10;
 z=z+1;
 c=c+20;
fill(255,255,255);
ellipse(250,y,400,400);
ellipse(10,x,10,10);
ellipse(490,z,10,10);
fill(10,250,50);
ellipse(250,c,50,50);

if(y>500){
  y = 0;
}
if(x>500){
  x=0;
}
if(z>500){
  z=0;
}
if(c>500){
  c=0;
}
}


                
                
