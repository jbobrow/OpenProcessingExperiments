
/*
Pearlyn Lii
 ID 3 - Spring 2013
 1/31/13
 */

//setup -----

size(800, 800);
background(200);
smooth();
colorMode(HSB, 360, 100, 100);

//draw -----

for (int i = 0; i < width; i++) {
  stroke  (random(110, 220), random(0, 90), random (100), 150);
  noFill();
  float x = random(300, 800);
  strokeWeight(2);
  triangle(i, 0, width/2, height, x, i);
  rotate(radians(90));
}



