
Spiral[] mySpiral = new Spiral [200];

float x = 30;
float y = 30;

void setup() {
  size(600, 600);
  smooth();
  for (int i =0; i<Spiral.length; i++) {
  }
}

void draw() {
  background(255);
  for (int i=0; i<mySpiral.length; i++) {
    mySpiral[i].drawSpiral();
    mySpiral[i].update();
  }
}

class Spiral {

  
  Spiral(float xpos, float ypos, float angle, float offset, float scalar, float speed) {
  
  x = xpos;
  y = ypos;
  
  float angle = 0.0;
  float offset = 30;
  float scalar = 2;
  float speed = .03;
  }
}

void drawSpiral() {
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  ellipse (x+mouseX, y+mouseY, 16, 16);
  fill(random(0,255), random(0,255), random(0,255), random(0,255), random(25,255));
  angle += speed;
  scalar += speed;
}


void mousePressed() {
  if (mouseButton == LEFT) {
    speed = speed * -1;
  }
}

void update() {
}



