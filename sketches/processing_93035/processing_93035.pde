
float y = height*0.6;
float speedY = 0;
float gravity = -9.8/3*2;

float x = 0;
float speedX = 0;

float bounciness = 0.95;
float friction = bounciness + 0.035;

void setup() {
  size(1000,500);
  y = height*0.6;
  background(200);
  fill(127);
}

void draw() {
  background(200);
  
  speedY += gravity;
  y += speedY;
  
  if (y < 0) {
    speedY = (-speedY)*bounciness;
    y = 0;
  }
  
  if (x > width/2) {
    speedX = (-speedX)*bounciness;
    x = width/2;
  } else if (x < -width/2) {
    speedX = (-speedX)*bounciness;
    x = -width/2;
  }
  
  x += speedX;
  speedX *=0.985;
  if ((speedX > -0.1) && (speedX < 0.1)) {
    speedX = 0;
  }
  
  translate(width/2,height*0.85);
  translate(-x,-y);
  noStroke();
  ellipse(0,0,30,30);
}

void mouseClicked() {
  y = height*0.60;
  speedY = ((height*0.4)-mouseY)*0.25;
  x = 0;
  speedX = ((width/2)-mouseX)*0.1;
  bounciness = 0.2 + random(0.8);
  friction = bounciness + 0.035;
  if (friction >= 1) {
    friction = 0.99;
  }
}

void keyPressed() {
  if (key == ' ') {
    fill(random(255),random(255),random(255));
  }
}


