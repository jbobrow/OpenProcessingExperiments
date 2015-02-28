
float ball_x = 50;
float ball_y = 150;
float ballSize = 80;
float force_x = 10;
float force_y = 10;
color ballColor = color(100, 50, 255);

void setup() {  
  size (730, 400);
  smooth();
}

void draw() {
  drawMe();
  update();
  checkSides();
}

void drawMe() {
  stroke(ballColor);
  strokeWeight(5);
  noFill();
  ellipse(ball_x, ball_y, ballSize, ballSize);
}

void update() {
  ball_x = ball_x + force_x;
  ball_y = ball_y + force_y;
}

void checkSides() {
  if (ball_x > width-ballSize/2 + 5 || ball_x < ballSize/2 + 5) {
    force_x = force_x * -1;
    force_x = force_x + random(-0.5, 0.5);
    ballColor = color(random(255), random(255), random(255));
  }

  if (ball_y > height-ballSize/2 + 5 || ball_y < ballSize/2 + 5) {
    force_y = force_y * -1;
    force_y = force_y + random(-0.5, 0.5);
    ballColor = color(random(255), random(255), random(255));
  }
}

//makes the ball change direction
void mouseClicked() {
  force_x = force_x * -1;
}

//increases the size of the ball
void mouseDragged() {
  ballSize++;
}

//brings ball back to original size
void mouseReleased() {
  ballSize = 80;
}

//draws the background
void mouseMoved() {
  fill(0, 15);
  noStroke();
  rect(0, 0, width, height);
}


