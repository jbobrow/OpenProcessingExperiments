
background(242, 100, 47);
noStroke();
fill(#6699CC);
rect(5, 5, 90, 90);
colorMode(HSB);
for (int i = 0; i< 100; i++) {
  stroke(30, i*2.5, 255);
  line(i, 25, i, 75);
}
for (int j = 0; j < 100; j++) {
  stroke(j*2.5, 255, 255);
  line(j, 40, j, 60);
}
smooth();
fill(100, 204, 47, 150);
ellipse(50, 50, 70, 70);


