
//JAMIE'S DRAGON TAILS/////////

size(600, 600); 
background(255);
smooth();
 
noStroke();
fill(245, 240, 245, 100);

for (int x= 0; x<width; x=x+50)
{
 for (int y= 0; y<height; y=y+50)
 {
  quad(x,y, x*2, y*2, x+y, y+x, x+y/8, y+x/8);
 }
}
 
 
stroke(255);
for (int x= 0; x<=width; x=x+100)
{
 for (int y= 0; y<=height; y=y+100)
 {
   fill(245, 234, 208, 50);
  quad(x,y, x*1.2, y*1.2, x+y, y+x, x+y/8, y+x/8);
 }
}
