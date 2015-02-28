
size (200, 200);
background(0);
stroke(255);
strokeWeight(20);
fill(255, 0, 50);
ellipse(100, 100, 100, 100);
PImage abc = get(100, 100, 55, 55);

for (int i = 0; i<4; i++) {
  set(i*40, 145, abc);
}
