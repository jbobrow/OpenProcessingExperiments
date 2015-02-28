
size (700, 700);
background(0);
smooth ();

fill(255);
for (int y= 69; y <=height; y +=4) {
  for (int x = 6; x <= width; x +=9) {
    ellipse(-1*x + y, y, 6 - y/34, 16 - y/87);
    ellipse(1*x + y, y, 16 - y/4, 16 - y/10.0);
    ellipse(1*x + y, y, y/2, 45 - y/3);
    ellipse(-3*x + y, y, 2 - y/1, 16 - 2*y/7);
    ellipse(-2*x + y, y, 1 - y/1, 2 - 2*y/3);
    ellipse(-10*x + y, y, 1 - y/1, 8 - 2*y/9);
    ellipse(-1*x + y, y, 65 - y/1, 8 - 2*y/9);
  }
}



