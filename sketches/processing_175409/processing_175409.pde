
// physics from the Nature of Code by Daniel Shiffman.
// Ch3 wave motion and Ch6 'Seek' behaviour
// add a rotating head and seeking behaviour to sineWaveSnake

SnakeManager snake;

void setup() {
  size(800, 600);
  snake = new SnakeManager();
}

void draw(){;
  frameRate(10);
  background(255);
  snake.followTarget();
}

class Body { 
  int len =  70;
  Segment[] segments = new Segment[len];
  float x, y, size;

  Body() {
    // stack new segments on top of each other
    x = width/2;
    y = height/2;
    size = 2;
    for (int i = 0; i < len; i++) {
      if (i > 10) { 
        size += 0.2;
      }
      segments[i] = new Segment(x, y, size);
    }
  }

  void update (PVector renderPos) {
    segments[len-1].pos = renderPos; // update the lead segment
    // move the render values along the snake body, following the lead segment
    for (int i = 1; i < len; i++) {
      segments[i-1].pos = segments[i].pos;
    }
  }

  void display() {
    for (Segment s : segments) {
      s.display();
    }
  }
}


class Segment {
  PVector pos;
  float  rad;

  Segment(float x, float y, float f) {
    pos = new PVector(x, y); 
    rad = f;
  }

  void display() {
    stroke(255);
    strokeWeight(1);
    fill(0);
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, rad, rad);
    
  }
}
class Head {
  PVector pos;
  float flt, amplitude, period, x, y;
  
  Head() {
    pos = new PVector();
    period  = 7;   
    amplitude = 20; 
    x = 10;
    y = 0;
  }

  void display() {
    noStroke();
    fill(#B40D0D);
    strokeWeight(2);
    flt =  amplitude * cos(TWO_PI * frameCount/period);
    triangle(x+30, y-2, x+30, y+2, x+30+flt, y); //tongue

    fill(0);
    ellipseMode(CENTER);
    ellipse(x+24, y-3, 12, 12);// nostril surround
    ellipse(x+24, y+3, 12, 12);

    ellipse(x-18, y-3, 22, 22);// back of head
    ellipse(x-18, y+3, 22, 22);

    ellipse(x, y, 60, 24); // base

    ellipse(x-7, y-7, 30, 20);//eye surround
    ellipse(x-7, y+7, 30, 20);

    noFill();
    stroke(255);
    strokeWeight(1);
    quad(x-2, y, x+6, y-6, x+17, y, x+6, y+6); // diamonds
    quad(x-26, y, x-15, y-6, x-7, y, x-15, y+6);

    fill(#A0FC17);
    noStroke();
    ellipse(x-7, y-10, 13, 6);// eyes green
    ellipse(x-7, y+10, 13, 6);
    
    fill(255);
    ellipse(x+24, y-2, 5, 3);// nostrils
    ellipse(x+24, y+2, 5, 3);

    fill(0);
    ellipse(x-7, y-10, 6, 5); // eyes black
    ellipse(x-7, y+10, 6, 5);

    stroke(0);
    strokeWeight(1);
    line(x-12, y-11, x-2, y-10);  // eyes black
    line(x-12, y+10, x-2, y+9);
  }
}


class SnakeManager {
  Target target;
  Head head;
  Body body;
  PVector pos, accel, vel, waveVel, wavePos, desired;
  float maxSpeed, maxForce, angle, dist, m, amplitude, period;

  SnakeManager() {
    target = new Target();
    head = new Head();
    body = new Body();
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    wavePos = new PVector(); 
    waveVel = new PVector();
    desired = new PVector();
    maxSpeed = 4;
    maxForce = 0.1;
    period = 30;
    amplitude = 15;
  } 

  void applyForce(PVector f) {
    accel.add(f);
  }

  void followTarget() { // the seek() method from NOC Ch6
    target.move();
    desired = PVector.sub(target.pos, pos);  
    dist = desired.mag(); 
    desired.normalize();  
    if (dist < 100) {
      m = map(dist, 0, 100, 0, maxSpeed);
      desired.mult(m);
    } else {
      desired.mult(maxSpeed);
    }
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    applyForce(steer); 
    update(); 
    addWave();
    body.update(wavePos); // move the location values along the segment array
    display(); // both the head and body
  }

  // calculate a path for the wave component of movement
  void addWave() {
    waveVel.set(-vel.y, vel.x); // normal to vel
    waveVel.normalize();
    waveVel.mult(amplitude * sin(TWO_PI * frameCount / period));
    waveVel.add(vel);
    wavePos = PVector.add(waveVel, pos);
  }

  void update() {
    vel.add(accel);
    pos.add(vel);
    accel.mult(0);
  }

  void display() {
    body.display();
    angle = desired.heading2D();
    // angle = vel.heading2D();
    translate(wavePos.x, wavePos.y);
    rotate(angle);
    scale(0.8);
    head.display();
  }
}

class Target {
  PVector pos;
  Target() {
  }
  void move() {
    pos = new PVector(mouseX, mouseY);
    fill(255);
    ellipse(mouseX, mouseY, 50, 50);
    fill(0 );
    ellipse(mouseX, mouseY, 40, 40);
    fill( #7078FC);
    ellipse(mouseX, mouseY, 30, 30);
    fill(#FC0320 );
    ellipse(mouseX, mouseY, 20, 20);
    fill( #F8FC03);
    ellipse(mouseX, mouseY, 10, 10);
  }
}



