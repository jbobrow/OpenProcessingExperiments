
size(600, 600);
smooth();
background(0);



for (int y = 0; y<=height; y=y+11){
for (int x = 0; x<=width; x=x+23)
{
  stroke(222, 185, 92, 180);
  noFill();
  line (x, y, x+100, 2*(x-30));
  
}
}


