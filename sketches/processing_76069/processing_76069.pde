

size(600, 600);
background(255);

for (int x = 5; x < width-80; x = x + 5) {
  smooth();
  noFill();
  beginShape();
  vertex(20, height-20); // V1 (see p.76)
  bezierVertex(5, x, x, 5, width-20, 20); // C1, C2, V2
  endShape();
}

