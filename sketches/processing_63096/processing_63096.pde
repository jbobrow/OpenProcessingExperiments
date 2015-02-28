
size(600, 600);
smooth();
background(0);



for (int y = 0; y<=height; y=y+20){
for (int x = 0; x<=width; x=x+30)
{
  stroke(222, 185, 92, 180);
  noFill();
  arc (x, y, x+2, 10, 20, 20);
}
}

for(int y= 300; y<=480; y=y+4){
  for(int x = 300; x<=480; x=x+5){
    fill(222, 185, 92, 40);
  noStroke();
    ellipse(x, y, x+20-y, y+20-x);
      rotate(PI+x*y);
  }
}
    
    for(int y= 300; y<=380; y=y+4){
  for(int x = 300; x<=380; x=x+5){
    fill(61, 224, 209, 40);
  noStroke();
    ellipse(x, y, x+20-y, y+20-x);
      rotate(PI+x*y);
  }
}
    


