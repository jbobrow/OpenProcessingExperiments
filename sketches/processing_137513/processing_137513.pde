
/* Douglas Tran March 02 Creative Computing Rory Solomon */


size (500, 500);
smooth();

background(100, 100, 100, 100);

for (int y = 50; y <= height-20; y += 50) {
  for (int x = 50; x <= width-20; x += 50) {
    fill(255);
    ellipse (x, y, 5, 5);
    line (x, y, 250,250);
  }
}




