
float grav = 1.0;
float speed;
float bounceSpeed = 18.0;
int circY;
int circWidth;
int state = 0; // 0 = rest, 1 = jump


void setup() {
  size(300, 600);
  background(255);
  smooth();
}

void drawBackground() {
  fill(0, 150);
  rect(0, height - 200, 300, 200);
  fill(155, 150);
  rect(0, height - 400, 300, 200);
  fill(255, 150);
  rect(0, 0, 300, 200);
}

void draw() {
  //  background(255);
  drawBackground();
  if (state == 0) {
    circWidth = 100;
    circY = height - 50;
    speed = 0.0;
    //    fill(255, 0, 0);
    //    strokeWeight(2);
    //    ellipse(width/2, circY, circWidth, circWidth);
    //    bounceSpeed = 18;
  }
  else if (state == 1) {
    speed -= grav;
    circY -= speed;
    if (circY >= height - 50) state = 2;
    bounceSpeed = (abs(speed) - 2);
    //    ellipse(width/2, circY, circWidth, circWidth);
  }
  else if (state == 2) {
    speed -= grav;
    circY -= speed;
    if (circY >= height - 50) {
      bounceSpeed -= 2;
      speed = bounceSpeed;
    }
    if (bounceSpeed <= 0) state = 0; 
    //    ellipse(width/2, circY, circWidth, circWidth);
  }

  fill(255, 0, 0, map(circY, height-50, 0, 255, 10));
  noStroke();
  ellipse(width/2, circY, 100, 100);
}

void mouseClicked() {
  state = 1;
  speed = 20;
//  saveFrame();
  //  bounceSpeed = 18;
}


