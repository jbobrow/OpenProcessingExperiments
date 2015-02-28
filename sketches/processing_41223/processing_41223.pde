
size(800, 800);
smooth();

fill(0, 76, 76, 15);
for (int y=0; y<=height; y+=8)
{
  for (int x=0; x<=width; x+=8)
  {
    ellipse (x, y, 16 - x/10.0, 16 - y/10.0);
  }
} 


//OTHER PATTERNS
/*for (int y=20; y <= height; y*= 1.2)
 {
 for (int x=0; x<=width; x+= 10)
 {
 point (x,y);
 }
 }
 


for (int i=0; i<400; i+=20)
 {
 line(i,0,i+i/2, 80);
 }
 

fill(255);
 stroke(102);
 for (int y=20; y<= height-20; y +=10)
 {
 for (int x=20; x<=width-20; x+=10)
 {
 ellipse (x,y,240,60);
 }
 }
 */



