
size (500, 500);
smooth ();

noFill();
for (int y= 44; y <=height; y +=10) {
  for (int x = 22; x <= width; x +=20) {
    ellipse(-2*x + y, y, 16 - y/10.0, 16 - y/10.0);
    ellipse(2*x + y, y, 16 - y/10.0, 16 - y/10.0);
 ellipse(2*x + y, y, y/10.0, 45 - y/10.0); 
 ellipse(-6*x + y, y, 16 - y/10.0, 16 - 2*y/10.0);
}
}

