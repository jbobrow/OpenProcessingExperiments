
background(#F6692E);
noStroke();
fill(100, 149, 200);
rect(5, 5, 90, 90);
colorMode(HSB);
for (int i = 0; i< 100; i++) {
  stroke(30, i*2.5, 255);
  line(i, 25, i, 75);
}
smooth();
fill(242, 204, 47, 160);
ellipse(50, 50, 70, 70);


