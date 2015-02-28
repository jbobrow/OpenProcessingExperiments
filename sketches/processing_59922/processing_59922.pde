
size(410, 200);
smooth();
background(255);

float x=1.5;
for (int i=40; i<=395; i+=80) {
  colorMode(HSB);
  strokeWeight(3);
  stroke(x, 150, 220);
  x+=50;
  line(i, 10, i, 190);
}

