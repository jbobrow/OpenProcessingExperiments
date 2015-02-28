
noStroke();
size(500, 500);
colorMode(RGB);
background(155,160,189);
for (int i = 0; i < width; i++) {
for (int j = 0; j < height; j++) {
    stroke(i, j, 10);
    point(i, j);
  }
}


