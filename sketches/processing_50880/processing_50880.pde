
size(800,800);
background(20, 50, 90);
smooth();


fill(11,181,5, 30);
stroke(245, 241, 5, 30);
for (int x=-10; x<=width; x+=10) {
  for (int y=-10; y<=height; y+=20) {
    ellipse(x+ y/4.0, y+x/4.0, 23-y/5.0, 23-x/5.0);
  }
}

