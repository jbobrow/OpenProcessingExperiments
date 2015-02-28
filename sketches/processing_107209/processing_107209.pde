
int smile; // global variable smile

void setup() {
  size( 600, 600);
  background(250, 250, 0);
  smooth();
  smile = int(random (3)); // makes the random number into an interger
}
void draw() {
  background(250, 250, 0); // refreshes page blank each frame

  // the face border
  rectMode(CENTER);
  stroke(0);
  strokeWeight(10);
  fill(250, 250, 0);
  rect(300, 300, 300, 400);

  // the eyes
  fill(0);
  triangle(180, 180, 280, 180, 280, 255);
  triangle(320, 180, 320, 255, 420, 180);

  // random smile
  if (smile == 0) {
    stroke(0);
    strokeWeight(20);
    line(215, 400, 380, 400);
  } else if (smile == 1) {
    stroke(0);
    strokeWeight(20);
    line(280, 400, 380, 360);
  } else {
    noStroke();
    fill(0);
    ellipseMode(CENTER);
    ellipse(300, 400, 60, 80);
  }
}

void mousePressed() {
  smile = (smile + 1) % 3; // cycles through the faces through mouse click
}
