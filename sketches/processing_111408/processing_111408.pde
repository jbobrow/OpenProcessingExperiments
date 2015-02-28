
size(600, 600);
smooth();
background(255);

noFill();
for (int x = -55; x < width + 55; x = x + 25) {
  for (int y = -55; y < height + 55; y = y + 25) {
    beginShape();
    vertex(x, y);
    vertex(x + 10, y + 35);
    vertex(x, y + 70);
    vertex(x + 35, y + 60);
    vertex(x + 70, y + 70);
    vertex(x + 60, y + 35);
    vertex(x + 70, y);
    vertex(x + 35, y + 10);
    endShape(CLOSE);
  }
}



