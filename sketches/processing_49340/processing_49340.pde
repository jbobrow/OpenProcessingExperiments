
float x, y;
float speed = 0;
float gravity = 0.1;

void setup() {
  size(640, 480);
  x = width/2;
  y = 0;
}


void draw() {
  background(0);
  smooth();
  
  displayCritter(x, y);

  y = y + speed;
  speed = speed + gravity;
  
  if (y > height) {
    speed = speed * -0.95;
  }
  
  if (y > height-55) {
    fill (0, 255, 0);
  }
}

void displayCritter(float x, float y) {
  //animal body
  noStroke();
  //fill(252, 151, 25);
  ellipse(x, y, 100, 100);
  ellipse(x-50, y, 12, 12);
  ellipse(x+50, y, 12, 12);

  //eyes and mouth
  fill(255);
  noStroke();
  ellipse(x-22, y-20, 15, 15);
  ellipse(x+22, y-20, 15, 15);
  fill(0);
  ellipse(x-22, y-20, 12, 12);
  ellipse(x+22, y-20, 12, 12);
  stroke(0);
  fill (252, 151, 25);
  //noFill();
  strokeWeight(2);
  arc(x, y-18, 12, 12, 0, 0+PI);
}

