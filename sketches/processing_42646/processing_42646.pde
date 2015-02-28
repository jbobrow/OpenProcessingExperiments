
int y = 100;
int speed = -1;

void setup() {
  size(200,200);
  smooth();
}

void draw() {
  background(255);

  // y location.
  y = y + speed;

  
  if ((y > 165) || (y < 35)) {
    // multiply speed by -1 to turn it around.
    speed = speed* - 1;
  }

  // Display circle at x location
  noStroke();
  fill(255,100,106);
  ellipse(100,y,32,32);
  
  rect(90,180,20,20);
  rect(90,0,20,20);
}



