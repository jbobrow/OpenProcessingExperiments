
/*
Jenny Hsu
 Benjamin Bacon
 Creative Computing Section B
 13 March 2014
 
 Week 5 Assignment #2
 Oldage TV
 */


void setup() {
  size(500, 500);
  smooth();
  background(200);
  frameRate(2);
}

void draw() {
  noStroke();
  for (int x = 0; x <= width; x += 40) {
    for (int y = 0; y <= height; y += 500) {

      fill (random(0, 255), random(0, 255), random(0, 255));
      rect(x, y, 40, 500);
    }
  }
}



