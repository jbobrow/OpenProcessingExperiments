
float y;
float x=3;
float z;
void setup()
{
  size(500,500);
}
void draw()
{
if(y>z){
  x=-x;
}
if(y>z){
  z=15;
}
if(y<0){
  x=-x;
}
z=485;
y=y+x;
background(0);
fill(150,0,50);
ellipse(250,y,60,60);
fill(0,75,150);
ellipse(165,y,50,50);
}
                
                
