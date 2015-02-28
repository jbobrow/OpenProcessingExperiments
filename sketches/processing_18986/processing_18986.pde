
// conditionals IV
// bouncing circle

// we can think of the speed of an object as "how many pixels
// that object moves per frame". 

// changing the sign of the speed reverses the object's direction

int x = 0;
int speed = 2;

//--------------------------------------------------------
void setup() {
  size(300, 300);
  smooth();
  noFill();
  stroke(255); // white
  strokeWeight(2);
}

//--------------------------------------------------------
void draw() {
  background(64); // dark gray
  ellipse(x, 150, 100, 100);
  x = x + speed;
  if ( x > width || x < 0 ) {
    // reverse the speed
    speed = speed * -1;
  }
}
