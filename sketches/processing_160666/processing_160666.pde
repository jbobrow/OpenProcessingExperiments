
float heroX;
float heroY;
float heroSize = 50;
float heroSpeed = 10;

boolean upTrue = false;
boolean downTrue = false;
boolean leftTrue = false;
boolean rightTrue = false;

void setup() {
  size(600, 600);
  heroX = width/2;
  heroY = height/2;
}


void draw() {
  background(255);

  //Move Hero
  if (upTrue) {
    heroY -= heroSpeed;
  }
  if (downTrue) {
    heroY += heroSpeed;
  }
  if (leftTrue) {
    heroX -= heroSpeed;
  }
  if (rightTrue) {
    heroX += heroSpeed;
  }

  //Draw Hero
  fill(255, 0, 0);
  ellipse(heroX, heroY, heroSize, heroSize);
}

void keyPressed() {
  if (key == 'w') {
    upTrue = true;
  } else if (key == 's') {
    downTrue = true;
  } else if (key == 'a') {
    leftTrue = true;
  } else if (key == 'd') {
    rightTrue = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    upTrue = false;
  } else if (key == 's') {
    downTrue = false;
  } else if (key == 'a') {
    leftTrue = false;
  }
  if (key == 'd') {
    rightTrue = false;
  }
}



