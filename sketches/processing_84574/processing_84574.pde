
colorMode (RGB);
size (300, 300);
background(10);
smooth();
noStroke();

for (i=50; i <=255; i+=50) {
  fill (247, 204, i);
  ellipse(i, 50, 50, 50);
  fill(i, 200, i);
  ellipse(i, 150, 50, 50);
  fill(200, i, 150);
  ellipse(i, 250, 50, 50);

  fill(0, 0, i, i);
  rect(i, 0, 100, 100);
  fill(i, 31, 160, i);
  rect(i, 100, 100, 100);
  fill(0, i, 0, i);
  rect(i, 200, 100, 100);
}
