
float xPos;
float yPos;
  
float x = 2;
float y = 2;
float r = random(12);
int m = 1;
  
void setup(){
size(600,600);
 
xPos = 300;
yPos = 300;
}
  
void draw(){
   
fill(255, 255, 255, 1);
ellipse(xPos,yPos, 10, 10);


y = y + r;
r = r * 1;
 
float xChange = cos(radians(r));
float yChange = sin(radians(y));
 
  xPos += xChange * r * (m);
  yPos += yChange * r * (m);
if( xPos>600 )
{
  m = m*(-1);
}
if (xPos<0)
{
  m = m*(-1);
}

  
 
}


