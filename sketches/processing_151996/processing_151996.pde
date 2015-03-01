
size(500, 500);
background(0);

int i = 0;
for (int x = 0; x <= width; x += 20) {
  for (int y = 0; y <= height; y += 20) {
    pushMatrix();
    translate(x, y);
    rotate(i*QUARTER_PI);
    stroke(100, 200, 100);
    line(0, 0, 10, 10);
    popMatrix();

  }
  i++;
}
