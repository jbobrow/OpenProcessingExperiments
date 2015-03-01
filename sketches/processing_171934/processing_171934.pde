
// wave physics from the 'Nature of Code' by Daniel Shiffman.
// Ch. 3 Oscillation

Snake Rupert;

void setup() {
  size(600, 600);
  Rupert = new Snake();
}

void draw() {
  background(0);
  Rupert.go();
  frameRate(10);
}

class Head {
  float period, amplitude, f;
  Head() {
    period  = 7;   
    amplitude = 20;
  }
  void display(float x, float y) {
    ellipseMode(RADIUS); 
    stroke(1);
    fill(#28F741);
    ellipse(x, y-12, 15, 10);                     
    ellipse(x, y+10, 13, 8);               
    fill(0);
    ellipse(x, y+10, 10, 4);             
    fill(#28F741);
    ellipse(x, y, 20, 10);                    
    fill(255);
    ellipse(x-5, y-13, 4, 5);
    ellipse(x+5, y-13, 4, 5);
    triangle(x-10, y+9, x-6, y+9, x-8, y+20);         
    triangle(x+6, y+9, x+10, y+9, x+8, y+20);
    fill(0); 
    ellipse(x-5, y-11, 2, 3);
    ellipse(x+5, y-11, 2, 3);
    ellipse(x-3, y+4, 1, 3); 
    ellipse(x+3, y+4, 1, 3);
    noStroke();
    fill(#FF0D21);
    f =  amplitude * sin(TWO_PI * frameCount/period);
    triangle(x-4, y+10, x+4, y+10, x, y+10+f);        
  }
}

class Segment {
  PVector accel, vel, pos, move, wavePos, waveVel;
  float period, amplitude, size;

  Segment(float x, float y, float rad) {
    accel = new PVector(0, 0);
    vel = new PVector(0, 0);
    pos = new PVector(x, y); // the location driven by accel/vel
    // set initial wavePos render values off monitor   
    wavePos = new PVector(-x, -y);  
    waveVel = new PVector();
    size = rad;
    period = 30;
    amplitude = 15;
    move = new PVector(random(-1, 1), random(-1, 1));
    move.normalize();
    move.mult(3);
    applyForce(move);
  }

  void applyForce(PVector f) {
    accel.add(f);
  }
  
// calculate a path for the wave.
// use separate velocity & location vectors for
// the wave component of each segment's movement
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
    stroke(0);
    fill(#28F741);
    ellipseMode(RADIUS);
    ellipse(wavePos.x, wavePos.y, size, size);
  }
}

class Snake {
  Head head;
  int len = 50;
  Segment[] segments = new Segment[len];
  float x, y, size;

  Snake() {
    // the snake body segments, stacked on top of each other
    x = width/2;
    y = height/2;
    size = 2;
    for (int i = 0; i < len; i++) {
      if (i > 10) { 
        size += 0.3;
      }
      segments[i] = new Segment(x, y, size);
    }
    head = new Head();
  }

  void go() {
    move();
    display();
    wrap();
  }

  void move () {
    // tell the lead segment which way to go and then superimpose the wave on it
    segments[len-1].update();
    segments[len-1].addWave();
    // move the render values along the snake body, to follow the lead segment
    for (int i = 1; i < len; i++) {
      segments[i-1].wavePos = segments[i].wavePos;
    }
  }

  void display() {
    // the body segments
    for (Segment s : segments) {
      s.display();
    }
    // place the head on top of the leading segment
    head.display(segments[len-1].wavePos.x, segments[len-1].wavePos.y);
  }

  // Rupert is a bit shy so he doesn't return immediately 
  void wrap() {
    if (segments[len-1].pos.x > width+40   ) {
      segments[len-1].pos.x = -40;
    }
    if (segments[len-1].pos.x < -40) {
      segments[len-1].pos.x = width+40;
    }
    if (segments[len-1].pos.y > height+40   ) {
      segments[len-1].pos.y = -40;
    }
    if (segments[len-1].pos.y < -40) {
      segments[len-1].pos.y = height+40;
    }
  }
}



