
size(600, 600);
smooth();
background(0);



for (int y = 0; y<=height; y=y+45){
for (int x = 0; x<=width; x=x+30)
{
  stroke(222, 185, 92, 180);
  noFill();
  ellipse (x, y, x+100, 100);
  
}
rotate(PI);
}


