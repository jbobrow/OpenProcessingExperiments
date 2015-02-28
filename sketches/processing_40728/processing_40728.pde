



int hours;
int minutes;
int seconds;


void setup() {
  size(500, 500);
  background(40);
  smooth();
}

void draw() {
  hours=hour();
  minutes=minute();
  seconds=second();

  if (hours>12) {
    hours -= 12;
  }

  background(40); //to clear previous

  translate (250, 250);
  rotate(radians(-90));

  noFill();
  strokeWeight(1);
  stroke(#ffffff);
  ellipse(0, 0, 50, 50);

  pushMatrix();
  rotate(radians(30*hours));
  fill(#ffffff);
  ellipse(25, 0, 5, 5);
  popMatrix();

  noFill();
  strokeWeight(1);
  stroke(#ffffff);
  ellipse(0, 0, 150, 150);

  pushMatrix();
  rotate(radians(6*minutes));
  fill(#ffffff);
  ellipse(75, 0, 10, 10);
  popMatrix();

  pushMatrix();
  rotate(radians(6*minutes));
  strokeWeight(.5);
  noFill();
  ellipse(75, 0, 10, 10);
  ellipse(75, 0, ((10+1)*seconds), ((10+1)*seconds));
  popMatrix();
}


