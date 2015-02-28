
size (400, 400);
background(10);
int x=50;
if (x > 25) {
  noStroke();
  ellipse (200, 200, 50, 50);
  ellipse (0, 0, 50, 50);
  ellipse (width, 0, 50, 50);
  ellipse (0, height, 50, 50);
  ellipse (width, height, 50, 50);
} 
stroke(255);
line (0, 0, width, height);
line (0, height, width, 0);
