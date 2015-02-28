
int steps = 32;
Orbiter[] Orb = new Orbiter[steps]; // float tmpX, float tmpY, float tmpOff, float tmpDiam
float r = 0;
float rad, off;

void setup() {
  float x, y;
  size(400, 400);
  background(0);
  stroke(255);
  rad = width/4;

  for (int i = 0; i < steps; i++) {
    x = width/2 + sin(r) * rad;
    y = height/2 + cos(r) * rad;
    fill(255);
    noStroke();
    Orb[i]= new Orbiter(x, y, r, width/2);    
    r += PI/(steps/2);
  }
}


void draw() {
  fill(255);
  noStroke();
  rect(0, 0, width, height);
  fill(0);
  ellipse(width/2, height/2, width, height);
  for (int i = 0; i < steps; i ++) {
    Orb[i].display();
  }
}

class Orbiter {
  float diam, offset, x, y, xpos, ypos;
  float theta = 0.0;

  Orbiter(float tmpX, float tmpY, float tmpOff, float tmpDiam) {
    offset = tmpOff;
    diam = tmpDiam;
    xpos = tmpX;
    ypos = tmpY;
  }

  void display() {
    noFill();
    stroke(255);
    ellipse(xpos, ypos, diam, diam);
    fill(255);
    x = xpos + sin(theta+offset)* diam/2;
    y = ypos + cos(theta+offset)* diam/2;
    ellipse(x, y, 10, 10);

    theta += 0.03;
  }
}
