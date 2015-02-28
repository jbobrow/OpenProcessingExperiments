
int [] posX =  {50,100,140, 195,270};
float r,g,b;
int i;


void setup()
{ 
size(300, 300);
background(255);
r=random(255); g=random(255); b= random(255);
fill (0);
rect (0,0,20,300);
rect (0,280,300,280);
rect (280,0,20,300);
fill (r,g,b);
if (mouseX <= 20 || mouseX >=280 || mouseY >=280)
 {
    for( int i = 0; i < posX.length; i++)
    {
      posX[i] =i *6;
    }
 }
}
void draw()
{
 
  rect (posX [0],40,10,10);
 
  ellipse (posX [1],80,30,30);
 
  triangle (posX[2],120,120,20,20,20);
 
  rect (posX [3],160,10,10);
  
  ellipse (posX [4],200,10,10);
 }
