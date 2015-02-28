
size(900, 500);
background(255);
smooth();
for (int y = 32; y <= height; y += 3) {
  for (int x = 12; x <= width; x += 70) {
    ellipse(x + y, y, 16 - y/10.0, 16 - y/10.0);
    fill(255);
    line(x+y, y, 576-y/30.0, 576-y/30.0);
    stroke(x/5);
  }
}

saveFrame("line1.png");

