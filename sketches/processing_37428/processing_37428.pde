
size (300, 300);
colorMode(RGB);
background(0);

for (int x=5; x<450; x+=5) {
  noFill();
  stroke(0, 200, 150);
  ellipse(150, 150, x, x);
}

rectMode(CORNERS);
noStroke();
fill(0);
rect(10, 5, 220, 300);

for (int x=5; x<300; x+=5) {
  noFill();
  stroke(255);
  triangle(10, x, 150, 150, 220, x);
}

for (int x=1; x<=300; x+=10) {
  stroke(255, 234, 0);
  line(147, x, 153, x);
}

