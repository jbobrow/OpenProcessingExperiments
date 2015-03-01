
float fAngle, tAngle, radius; 
float mx, my, margin;
float rInc, eInc; 
Ball[] balls; 
int numBalls; 
boolean looping = true; 

void setup() {
  size(500, 500); 
  background(0); 
  smooth(); 
  noStroke(); 

  frameRate(40); 

  mx = width/2;
  my = height/2; 
  margin = 10; 

  fAngle = 0; 
  tAngle = 30;
  radius = width/2 - margin;

  rInc = 0.5; 
  eInc = 0.1;

  numBalls = 30; 
  balls = new Ball[numBalls];
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(0);  
  translate(mx, my); 

  for (int i = 0; i < numBalls; i++) {
    balls[i].display(); 
    balls[i].update();
  }
}

class Ball {
  float r, a, eSize; 
  int c, alpha; 

  Ball() {
    r = random(5, radius-5);
    eSize = 5; 
    a = random(fAngle, tAngle);
    c = color(random(255), random(255), 255);
    alpha = 175;
  }

  void update() {
    r += rInc; 
    eSize += eInc;

    if (r > radius) {
      r = random(5, radius/4); 
      eSize = 5; 
      a = random(fAngle, tAngle);
      c = color(random(255), random(255), 255);
    }
  }

  void display() {
    float x, y; 

    x = -mx + margin + cos(radians(a)) * r;
    y = sin(radians(a)) * r; 
    fill(c, alpha); 
    pushMatrix(); 
    for (int j = 0; j < 6; j++) {
      ellipse(x, y, eSize, eSize);
      ellipse(x, -y, eSize, eSize);
      rotate(radians(60));
    }
    popMatrix();
  }
}

void mouseReleased() {
  looping = !looping; 
  if (looping) {
    loop();
  } else {
    noLoop();
  }
}



