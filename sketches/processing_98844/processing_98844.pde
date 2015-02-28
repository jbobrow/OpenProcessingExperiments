
int numBalls = 30;
float spring = 0.05;
float gravity = 0.03;
float friction = -0.9;
Shape[] shapes = new Shape[numBalls];
float protoAngle;
float protoDistance;
int ii;

void setup() {
  size(640, 360);
  for (int i = 0; i < numBalls; i++) {
    shapes[i] = new Shape(random(width), random(height), random(30, 30), i, shapes);
  }
  noStroke();
  fill(255, 204);
  ii = 0;
}

void draw() {
  background(0);
  if (ii % 15 == 0) {
    protoAngle = random(0, 360);
  }
  protoDistance = random(0, 5);

  // dont update angle at seach step....


  for (int i = 0; i < numBalls; i++) {
    shapes[i].move();
    shapes[i].display();
  }
  ii++;
}

class Shape {

  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  float alpha;
  Shape[] others;

  Shape(float xin, float yin, float din, int idin, Shape[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 

  void move() {
  
 //   if (ii % 15 == 0) {
      alpha = protoAngle; // + random(0, 90);
  //  } 


    float d = protoDistance  + random(-5, 5);

    y = y +  d * sin(alpha);
    x = x +  d * cos(alpha);
    if (x>width) { 
      x = 0;
    }
    else if (x<0) { 
      x = width;
    }

    if (y>height) { 
      y = 0;
    }
    else if (y<0) { 
      y = height;
    }
  }
  void move_orig() {
    vy += gravity; 
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      x = width - diameter/2;
      vx *= friction;
    }
    else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction;
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
  }

  void display() {
    ellipse(x, y, diameter, diameter);
  }
}
