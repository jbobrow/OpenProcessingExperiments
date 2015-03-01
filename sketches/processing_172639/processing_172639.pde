
// An animated helicopter displaying the boundary behavior described
// in Ch6 of 'The Nature of Code' by Daniel Shiffman.

Vehicle chopper;

void setup() {
  size(820, 640);
  chopper = new Vehicle(width/2, height/2);
}
void draw() {
  background(#F22E69);
  chopper.run(); 
}



class Vehicle {
  DrawHelicopter hlcptrDraw;
  PVector pos, vel, accel;
  float maxspeed, maxforce, d;

  Vehicle(float x, float y) {
    hlcptrDraw = new DrawHelicopter();
    accel = new PVector(1, 2);
    vel = new PVector();
    pos = new PVector(x, y);
    maxspeed = 3;
    maxforce = 0.1;
    d = 120;
  }

  void run() {
    update();
    boundaries();
    display();
  }

  void update() {
    vel.add(accel);
    vel.limit(maxspeed);
    pos.add(vel);
    accel.mult(0);
  }
  
  void boundaries() {
    PVector desired = null;
    if (pos.x < d) {
      desired = new PVector(maxspeed, vel.y);
    } else if (pos.x > width -d) {
      desired = new PVector(-maxspeed, vel.y);
    } 
    if (pos.y < d) {
      desired = new PVector(vel.x, maxspeed);
    } else if (pos.y > height-d) {
      desired = new PVector(vel.x, -maxspeed);
    } 
    if (desired != null) {
      desired.normalize();
      desired.mult(maxspeed);
      PVector steer = PVector.sub(desired, vel);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }  

  void applyForce(PVector force) {
    accel.add(force);
  }

  void display() {
    float theta = vel.heading2D() + HALF_PI;
    translate(pos.x, pos.y);
    rotate(theta);
    hlcptrDraw.display();
  }
}

// all the drawing and animation code
class DrawHelicopter {
  int rX, rY, rO, rI, rW, rL, cW, cH;
  float angle, increment, period, amplitude, flt;

  DrawHelicopter() {
    // rotor dimensions
    rX = 0;            // pivot 
    rY = 0;            //   "
    rO = 100;          // outer radius
    rI = 10;           // inner radius
    rW = 5;            // width
    rL = rO - rI;      // length
    increment = radians(15); // spin by 

    // tail prop oscillation
    period  = 5;    // num of frames for 1 cycle
    amplitude = 20; // dist from center to either extreme
  }

  void spinRotor() {
    angle += increment;
    rotate(angle);
    noFill();
    rect( rX -rW/2, rY-rO, rW, rL); 
    rect( rX -rW/2, rY+rI, rW, rL);
    rect(rX + rI, rY-rW/2, rL, rW);
    rect(rX -rO, rY-rW/2, rL, rW);
  } 
 
  void drawBody() { // referenced to rotor pivot 
    line(rX-30, rY-5, rX+26, rY-5);// attach feet
    line(rX-30, rY+30, rX+26, rY+30);
    fill(color(150));
    ellipse(rX, rY+10, 40, 70); //cabin
    fill(color(230));
    ellipse(rX, rY-17, 22, 12); //window(screen?)
    fill(color(0));
    ellipse(rX, rY, 6, 6); //pivot
    rect(rX-2, rY + 45, 4, 80); //central tail
    rect(rX-30, rY -15, 4, 60); //left foot
    rect(rX+26, rY-15, 4, 60); //right foot
    quad(rX+3, rY+110, rX+3, rY+125, rX+ 30, rY + 140, rX + 30, rY + 125); // right tail
    quad(rX-3, rY+110, rX-3, rY+125, rX- 30, rY + 140, rX - 30, rY + 125); // left tail
  }

  void animateTailProp() {
    // Nature of Code Ch3
    flt =  amplitude * cos(TWO_PI * frameCount/period);
    fill(color(0));
    rect( rX+5, rY + 140, 1, flt);
    rect( rX-1, rY+126, 1, 15);
    line( rX-1, rY+140, rX + 5, rY + 140);
  }

  void display() {
    drawBody();
    animateTailProp();
    spinRotor();
  }
}



