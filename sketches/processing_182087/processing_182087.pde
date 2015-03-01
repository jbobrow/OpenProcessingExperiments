
// A simple pendulum wave using the pendulum physics from 
//  Ch3 of the 'Nature of Code' by Daniel Shiffman 

Pendulum p;
Manager m;
int num, x, y; // the number of pendulums and anchor locations
float ang; // starting angle in degrees
color col;

void setup() {
  size(800, 300);
  num = 8;
  p = new Pendulum(ang, x, y, col); 
  m = new Manager(num);
}

void draw() {
  background(#36EDF2);
  m.run();
}



// organise the wave
class Manager {
  int numBalls, ang, x, y ;
  Pendulum[] balls ;
  boolean inContact;
  color c;
  color green = (#2EFA14);
  color yellow = (#FCE740);

  Manager(int n) {
    numBalls = n;
    ang = -20;
    x = 200;
    y = 30;
    c = yellow;
    balls = new Pendulum[numBalls];

    for (int i = 0; i < balls.length; i = i+1) {
      balls[i] = new Pendulum(ang, x, y, c);
      x += 55;
      ang = 0;
      c = green;
    }
  }


  void run() {
    for (int outer = 0; outer < balls.length; outer++) {
      // move and dislay all the balls
      balls[outer].run();
      for (int inner = outer + 1; inner < balls.length; inner++) {
        inContact =  checkThese2( balls[outer], balls[inner]);
        // rudimentary(and hence not very robust) collision detection and response 
        if (inContact) {
          // swap velocities
          float hold = balls[outer].velScalar;
          balls[outer].velScalar = balls[inner].velScalar;
          balls[inner].velScalar = hold;
          // swap colours just for fun
          color hold2 = balls[outer].currentCol;
          balls[outer].currentCol = balls[inner].currentCol;
          balls[inner].currentCol = hold2;
        }
      }
    }
  }

  boolean  checkThese2(Pendulum b1, Pendulum b2) { 
    PVector howFar = PVector.sub(b1.pos, b2.pos);
    float howFarSquared = howFar.x * howFar.x + howFar.y * howFar.y;
    if (howFarSquared < (b1.radius + b2.radius )*(b1.radius + b2.radius )) {
      return true;
    } else {
      return false ;
    }
  }
}



// physics from 'Nature of Code' Ch3  Daniel Shiffman 

class Pendulum {
  PVector  pos, anchor;
  float  G, angleRad, velScalar, accelScalar, len, damping, radius; 
  color  currentCol;

  Pendulum(float angleDeg, int anchorX, int anchorY, color c) {
    pos = new PVector();
    anchor = new PVector(anchorX, anchorY);
    angleRad = radians(angleDeg);
    G = 0.1; // gravity
    len = 200;
    radius = 25;
    damping =  1.0 ; // 0.999;
    currentCol = c;
  }


  void move() { 
    // calc scalar angular accel on pendulum bob
    accelScalar = (-1 * G / len) * sin(angleRad);
    velScalar += accelScalar;
    velScalar *= damping;
    angleRad += velScalar;
    // update location vector
    pos.set(len * sin(angleRad), len * cos(angleRad));
    pos.add(anchor); // move relative to anchor
  }


  void display() { 
    stroke(0);
    strokeWeight(2);
    stroke(#3669F2);
    line(anchor.x, anchor.y, pos.x, pos.y); 
    fill(currentCol);
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, radius, radius);
    fill(#3669F2);
    ellipse(anchor.x, anchor.y, 5, 5);
  }

  void run() {
    move();
    display();
  }
}



