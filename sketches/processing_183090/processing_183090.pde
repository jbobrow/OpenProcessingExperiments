
// animation
// white lines on black background
// the lines begin on the left border and end on the right border
// the lines must be horizontal.
void setup() {
  frameRate(30);
  size(200, 200);
  background(0);
}


void draw() {

  stroke(random(200, 256), random(100, 125), random(50, 100));

  float distance_top =random(100);
  float distance_bottom =random(100, 200);


  line(distance_top, 0, distance_top, 99);
  line(distance_top, 0, distance_top, 99);
  line(distance_bottom, 100, distance_bottom, 200);
  line(distance_bottom, 100, distance_bottom, 200);
}

