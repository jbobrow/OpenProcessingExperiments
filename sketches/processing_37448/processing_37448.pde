
size (300, 300);

background (0);
smooth ();

//background ellipse
for (int x=0; x<=300; x+=20) {
  noFill();
  stroke (17, 235, x, 30);
  strokeWeight (x);
  ellipse (x, x, x, x);
}

//perspective lines
for (int x=4; x<=300; x+=15) {
  stroke (216, x, 227);
  strokeWeight(1);
  line (0, 0, 300, x);
  line (0, 0, x, 300);
}




