
size(700, 700);
smooth();
background(0);
 
 
 
for (int y = 0; y<=height; y=y+311){
for (int x = 0; x<=width; x=x+3)
{
  stroke(198);
  noFill();
  line (x, y, x+34, 2*(x-320));
   
}
}



