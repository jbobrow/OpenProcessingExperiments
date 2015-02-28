
size(480, 480);
noStroke();
smooth();
int b = 4;

for (float x = 0; x < height; x += b/2) {
  for (float y = 0; y < width; y += b/2) {
    fill(x/10+y/10);
    ellipse(x, y, b, -b);
  }
}



