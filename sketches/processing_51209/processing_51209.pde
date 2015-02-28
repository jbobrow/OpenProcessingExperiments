
size(900,500);
background(255);
smooth();
fill(255,0,0);
stroke(10);
for (int y = 20; y <= height-20; y += 15) {
  for (int x = 20; x <= width-20; x += 15) {
    ellipse(x, y, 25, 25);
    triangle(x-y, x ,y, x+y,x,y-x);
    line(x, y, 240, 60);
   
  }
}

saveFrame("line3.png");

