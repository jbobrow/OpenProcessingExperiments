
float aPos;
float bPos;
 
float a = 2;
float b = 2;
float r = random(12);
int m = 1;
 
void setup(){
size(600,600);

aPos = 300;
bPos = 300;
}
 
void draw(){
  
fill(255, 255, 255, 1);
ellipse(aPos,bPos, 10, 10);

b = b + r;
r = r * 1;

float aChange = cos(radians(r));
float bChange = sin(radians(b));

  aPos += aChange * r * (m);
  bPos += bChange * r;
if( aPos>600 ) 
{
  m = m*(-1);
}
if (aPos<0)
{
  m = m*(-1);
}



}





