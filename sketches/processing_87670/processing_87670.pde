
size(500, 500);
smooth();
background(255);
 
 
 
for (int y = 20; y<=height; y=y+11){
for (int x = 1; x<=width; x=x+23)
{
  stroke(115,162,117);
  noFill();
  line (x, y, x+430, 8*(x-2));
   
}
}



