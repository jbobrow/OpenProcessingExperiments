
size(600, 600);
smooth();
background(255);


for (int x = 0; x < width; x = x + 70) {
  for (int y = 0; y < height; y = y + 70) {

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



