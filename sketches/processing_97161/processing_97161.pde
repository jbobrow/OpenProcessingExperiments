
size(200, 200);
for (int i=30; i<180; i=i+25) {
  fill(i*10, 255, 50, i);
  ellipse(i, 80, 40, 40);
}
for (int i=-155; i<180; i=i+25) {
  stroke(27, 150, 98);
  strokeWeight(7);
  point(i+100, (i*i/200)+100);
}
