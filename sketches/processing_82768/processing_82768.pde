
size (200, 200);
background(30);
noStroke();
translate(100, 100);

for (int i=0; i<12; i++) {
  rotate(PI/6);
  fill(i*20, 150);
  rect (0, 0, 60, 60);
}
