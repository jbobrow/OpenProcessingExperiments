
// Ryanne Hollies
// PS3-3

star Star;
star Star2;
star Star3;


void setup() {
  size(600, 300, P3D);
  noStroke();
  colorMode(RGB, 1);
  fill(0.4);

  Star = new star();
  Star2 = new star();
  Star3 = new star();

}

void draw() {
  background(0);
  Star.display(width/2, height/2);
  Star2.display(width/10*4, height/10*4);
  Star3.display(width/10*6, height/10*4);

}


