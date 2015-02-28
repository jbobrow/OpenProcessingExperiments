
Ball[] balls = new Ball [6];



void setup() {
  size(600, 600);
  frameRate(30);
  int r = height/4;
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(width/2+r*cos(TWO_PI*(balls.length-i)/balls.length), height/2+r*sin(TWO_PI*(balls.length-i)/balls.length));
  }
}


void draw() {
  background(0);
  for (int i = 0; i < balls.length; i++) {
    for (int j = i + 1; j < balls.length; j++) {
      balls[i].collision(balls[j]);
      balls[i].lines(balls[j]);
    }
  }

  for (int i = 0; i < balls.length; i++) {
    balls[i].update();
    balls[i].bounce();
    PVector cue = new PVector(0, 0);
    if (mousePressed) {
      cue = new PVector((balls[i].location.x-mouseX), (balls[i].location.y-mouseY)); 
      // compute a force that sets Balls in motion based on their position relative to the mouse
      cue.mult(0.03);
      //cue.limit(2);
      balls[i].applyForce(cue);
    }
    PVector friction = balls[i].velocity.get();
    friction.mult(-1); 
    friction.normalize();
    float c = 0.35;
    friction.mult(c);
    balls[i].applyForce(friction);
    balls[i].display();
  }
}


boolean start = false;

void mousePressed() {
  start = false;
}
void mouseReleased() {
  start = true;
}

class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius;
  color c;




  Ball(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    radius = 30;
    c = color(255, random(140, 230), 8);
  }


  void update() {
    if (start) {
      velocity.add(acceleration);
      location.add(velocity);
      acceleration.mult(0);
    }
    if (start && velocity.mag() < 0.5) 
      velocity.mult(0); // otherwise balls slow down, ALMOST STOP, and then start moving again
    velocity.limit(30);
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }



  void lines (Ball b) {
    strokeWeight(0.8);
    stroke(100);
    line(location.x, location.y, b.location.x, b.location.y);
  }

  void collision(Ball b) {
    float d = dist(location.x, location.y, b.location.x, b.location.y);
    if ( d <  radius*2) { // swapping velocities
      PVector temp = velocity;
      velocity = b.velocity;
      b.velocity = temp;
    }
  }


  void bounce() {
    if (location.x > width - radius || location.x < radius) {
      velocity.x*=-1;
    }
    if (location.y > height - radius || location.y < radius) {
      velocity.y*=-1;
    }
  }


  void display() {
    location.x = constrain(location.x, radius, width-radius);
    location.y = constrain(location.y, radius, height-radius);
    noStroke();
    ellipse(location.x, location.y, radius*2, radius*2);
    smooth();
    fill(c);
    if (mousePressed) {
      c = color(255, random(140, 230), 8);
    }
  }
}

