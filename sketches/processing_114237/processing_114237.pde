
size(400, 400);
background(255);
fill(255);
for (int x=0; x<=width; x+=40) {
  for (int y=0; y<=height; y+=40) {
    for (int d=80; d>4; d /=1.2) {
      if ((y % 80) == 0) {
        stroke(100, 100, 255);
        ellipse(x, y, d, d);
      }
      else {
        stroke(255, 100, 100);
        ellipse(x-20, y, d, d);
      }
    }
  }
}
