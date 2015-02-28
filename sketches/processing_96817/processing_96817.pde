
float ballx;
float bally;

float balldx;
float balldy;

void a_new_round_is_started() {
  ballx = width/2;
  bally = height/2;

  if (random(100) < 50) {
    balldx = -1;
  }
  else {
    balldx = 1;
  }

  balldy = random(-3, 3);
}

void setup() {
  size(400, 400);

  a_new_round_is_started();
}

void drawball() {
  rect(ballx, bally, ballsize, ballsize);
}

void draw() {
  background(0);

  // this part never changes
  ballx = ballx + balldx;
  bally = bally + balldy;

  if (ballx < 0 || ballx > width) {
    a_new_round_is_started();
  }
  if (bally < 0 || bally > height) {
    balldy = -balldy; // balldy *= -1;
  }

  drawball();
}
