
size (500, 500);
smooth ();

noFill();
for (int y= 29; y <=height; y +=4) {
  for (int x = 45; x <= width; x +=16) {
    ellipse(x + y, y, 16 - y/10.0, 16 - y/10.0);
    ellipse(-x + y, y, 16 - y/10.0, 16 - y/10.0);
    ellipse(x - y, y, 16 - y/10.0, 16 - y/10.0);
  }
}


