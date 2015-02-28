
size(600, 600);
colorMode(RGB);
 for (int i =0; i<100; i++) {
 stroke(i*2.5, 255, 255);
 }


smooth();
for (int d =1000; d > 20; d -= 10) {
  fill(255);
  stroke(50);
  strokeWeight(.5);
  ellipse (d, d, d, d); //diagonal spiral
  stroke(255);
  strokeWeight(1);
  fill(0, 255, 163, 10);
  ellipse (300, 300, d, d); //radial
  ellipse (600, 0, 600, d); //vertical spiral
  ellipse (0, 600, d, 600); //horzontal spiral
  ellipse (0, 0, d, d); //left top corner
  ellipse (600, 600, d, d); //right bottom corner
}
