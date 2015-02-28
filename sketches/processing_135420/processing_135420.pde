
// circular motion using basic trigonometry. 
// Hypothenuse = radius
// Opposite = vertical, results in y-position
// Adjacent = horizontal (red), results in x-position
// x-position = cos(angle)*radius
// y-position = sin(angle)*radius

void setup() {
  size(500, 500);
  background(255);
}
// we're defining the position of a point now with radius and angle, not as x + y
float radius = 250;
float angle = -35; // note that 0 degrees is in the 3 o'clock position

void draw() {
  float xcoord = cos(angle*TWO_PI/360)*radius; // here we calculate the x-position of the point
  float ycoord = sin(angle*TWO_PI/360)*radius; // here we calculate the y-position of the point
  background(255);
  translate(width/2, height/2); // let's move the coordinates into the center
  noFill();
  strokeWeight(1);
  stroke(0);
  ellipse(0, 0, 500, 500);
  line(-250, 0, 250, 0);
  line(0, -250, 0, 250);
  if (mousePressed) {
    angle = angle + 1; // the triangle moves when pressed
  }

  // horizontal motion of the red dot, fast in the middle, slow on the outside
  stroke(0);
  strokeWeight(2);
  line(0, 0, xcoord, ycoord);
  line(xcoord, ycoord, xcoord, 0);
  stroke(255, 0, 0);
  strokeWeight(5);
  line(0, 0, xcoord, 0);
  ellipse(xcoord, 0, 10, 10);

  // 
  fill(0);
  text("angle "+int(angle%360), -240, -235);
  text("circlepoints", -240, 220); // x/y position of the dot on the circle
  text(int(xcoord)+" "+int(ycoord), -240, 235);
  text("sin "+ycoord/radius, 140, 220);
  text("cos "+xcoord/radius, 140, 235);
}

