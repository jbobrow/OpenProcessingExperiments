
int hours;
int minutes;
int seconds;

void setup() {
  size(1000, 500);
  colorMode(HSB, 360, 100, 100);
  background(0);
  rotate(radians(90));
  smooth();
  noFill();
  frameRate(60);
}

void draw() {
  hours = hour();
  minutes = minute();
  seconds = second(); 


  if (hours > 12) {
    hours -= 12;
  }    

  background(0);
  translate(500,250);
  ellipse(0, 0, 50, 50);


  stroke(15);
  for (int i = 450; i<1200; i+= 100) {
    ellipse(0, 0, i, i);
  }

  for (int i = 0; i<12; i++) {
    line(0,-175,0,-225);
    rotate(radians(30));
  }

  hourcircle();
  minutecircle();
  secondcircle();
}

void hourcircle() {
  strokeWeight(10);
  strokeCap(SQUARE);
  stroke(25);
  noFill();
  pushMatrix();
  rotate(radians(30 * hours));
  ellipse(0, 0, 350, 350);
  line(0, -175, 0, -125);
  popMatrix();
}

void minutecircle() {
  strokeWeight(10);
  strokeCap(SQUARE);
  stroke(50);
  noFill();
  pushMatrix();
  rotate(radians(6 * minutes));
  ellipse(0, 0, 250, 250);
  line(0, -125, 0, -75);
  popMatrix();
}

void secondcircle() {
  strokeWeight(10);
  strokeCap(SQUARE);
  stroke(75);
  noFill();
  pushMatrix();
  rotate(radians(6 * seconds));
  ellipse(0, 0, 150, 150);
  line(0, -75, 0, -25);
  popMatrix();
}


