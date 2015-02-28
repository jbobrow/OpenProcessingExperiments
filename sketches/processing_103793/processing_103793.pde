
import arb.soundcipher.*;
SoundCipher sc = new SoundCipher(this);
SoundCipher amb_sc = new SoundCipher(this);

Firefly[] fireflies;
Attractor[] attractors;
int numFireflies = 12;
int numAttractors = 1;
int numWaves = 12;
boolean togFog;
FogGen[] fog = new FogGen[numWaves];

void setup() {
  togFog = false;
  smooth();
  frameRate(30);
  size(1024, 512);
  for (int i = 0; i < numWaves; i++) {
    fog[i] = new FogGen(5, 0f);
  }
  fireflies = new Firefly[numFireflies];
  attractors = new Attractor[numAttractors];
  for (int i = 0 ; i < numFireflies; i++) {
    fireflies[i] = new Firefly();
  }
  for (int i = 0 ; i < numAttractors; i++) {
    attractors[i] = new Attractor();
  }
}

void draw() {
  background(5);
  // draw grid
  pushStyle();
  stroke(200, 5);
  strokeWeight(1);
  for (int i = 0; i < 80; i++) {
    float x = i*width/80;
    line(x, 0, x, height);
  }
  for (int j = 0; j < 40; j++) {
    float y = j*height/40;
    line(0, y, width, y);
  }
  popStyle();
  // draw attractors
  for (int i = 0; i < numAttractors; i++) {
    attractors[i].drag();
    attractors[i].hover(mouseX, mouseY);
    attractors[i].playNote(fireflies);
    attractors[i].display();
  }
  // draw fog
  if (togFog) {
    for (int i = 0; i < numWaves; i++) {
      fog[i].update();
      fog[i].display();
    }
  }

  // draw fireflies
  for (int i = 0; i < numFireflies; i++) {
    for (int j = 0; j < numAttractors; j++) {
      PVector force = attractors[j].attract(fireflies[i]);
      fireflies[i].applyForce(force);
      fireflies[i].update();
      fireflies[i].display();
    }
  }

  fill(255);
  textSize(12);
  text("Click and drag the moon", 10, height - 10);
  text("Press f to toggle fog on/off", 10, height - 20);
}


void mousePressed() {
  for (int i = 0; i < numAttractors; i++) {
    attractors[i].clicked(mouseX, mouseY);
  }
}

void mouseReleased() {
  for (int i = 0; i < numAttractors; i++) {
    attractors[i].stopDragging();
  }
}

void keyPressed() {
  if (key == 'f' || key == 'F') {
    togFog = !togFog;
  }
}

class Attractor {
  float mass;    // Mass, tied to size
  float G;       // Gravitational Constant
  PVector location;   // Location
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PVector dragOffset;  // holds the offset for when object is clicked on

  Attractor() {
    sc.instrument = sc.OCARINA;
    amb_sc.instrument = sc.WARM_PAD;
    location = new PVector(random(width/3, 2*width/3), random(height/3, 2*height/3));
    mass = 60;
    G = 2;
    dragOffset = new PVector(0.0, 0.0);
  }

  PVector attract(Firefly m) {
    PVector force = PVector.sub(location, m.location);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    d = constrain(d, 5.0, 25.0);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (G * mass * m.mass) / (d * d);      // Calculate gravitional force magnitude
    force.mult(strength);                                  // Get force vector --> magnitude * direction
    return force;
  }

  // Method to display
  void display() {
    pushStyle();
    ellipseMode(CENTER);
    strokeWeight(2);
    stroke(0);
    if (dragging) fill (220);
    else if (rollover) fill(220);
    else fill(#FFFDAF);
    ellipse(location.x, location.y, mass*2, mass*2);
    popStyle();
  }

  // The methods below are for mouse interaction
  void clicked(int mx, int my) {
    float d = dist(mx, my, location.x, location.y);
    if (d < mass) {
      dragging = true;
      dragOffset.x = location.x-mx;
      dragOffset.y = location.y-my;
    }
  }
  boolean onCollision(Firefly firefly) {
    float d1 = location.dist(firefly.location);
    float d2 = location.dist(firefly.prevLoc);
    boolean isColliding = d1 < (mass);
    boolean wasColliding = d2 < (mass);
    return (isColliding && !wasColliding);
  }

  void playNote(Firefly[] fireflies) {
    for (int i = 0; i < fireflies.length; i++) {
      if (onCollision(fireflies[i])) {
        sc.playNote(90 - fireflies[i].bodySize*2, 100, 1);
      }
    }
  }

  void playAmbience() {
    float pitch = map(location.y, 0, height, 90, 40);
    amb_sc.playNote(pitch, 50, 10);
  }

  void hover(int mx, int my) {
    float d = dist(mx, my, location.x, location.y);
    if (d < mass) {
      rollover = true;
    } 
    else {
      rollover = false;
    }
  }

  void stopDragging() {
    dragging = false;
  }

  void drag() {
    if (dragging) {
      location.x = mouseX + dragOffset.x;
      location.y = mouseY + dragOffset.y;
      playAmbience();
    }
  }
}

class Firefly {

  PVector location, prevLoc, velocity, acceleration;
  int bodySize, trailSize;
  float topspeed;
  PVector[] trail;
  color colour;
  float mass;
  float t0 = random(1000); // choose an arbitrary initial value fot time

  Firefly() {
    location = new PVector(random(width), random(height));
    prevLoc = location.get();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    bodySize = (int)random(7, 14);
    trailSize = 10;
    mass = 1;
    trail = new PVector[trailSize];
    // println("loc: " + location.x + "," + location.y);
    for (int i = 0; i < trailSize; i++) {
      trail[i] = location;
    }
    topspeed = 10;
    colour = #34F5A6;
  }

  void display() {
    ellipseMode(CENTER);
    float alfa;
    // draw the trail
    for (int i = 0; i < trailSize-1; i++) {
      pushStyle();
      alfa = (i+1)*100/trailSize; // increase alfa
      noFill();
      stroke(colour, alfa);
      float r = bodySize-(trailSize-i);
      r = constrain(r, 0, bodySize);
      strokeWeight(r/4);
      ellipse((trail[i]).x, (trail[i]).y, r, r);
    }
    // change brightness as noise
    float r, g, b;
    r = red(colour);
    g = green(colour);
    b = blue(colour);
    float bright = 1.2*sin(frameCount/3 + t0);
    // println(bright);
    bright = map(bright, 0, 1, 0, 50);
    r += bright;
    g += bright;
    b += bright;
    // println("(" + r + "," + g + "," + b + ")");
    fill(color(r, g, b));
    strokeWeight(bodySize/4);
    stroke(12, 150);
    ellipse(location.x, location.y, bodySize, bodySize);
    popStyle();
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);
    // save current location as the last element of the array
    trail[(trailSize-1)] = location;
    // shift values to the left
    for (int i = 0; i < (trailSize-1); i++) {
      // println("loc" + i + ": " + (trail[i]).x + "," + (trail[i]).y);
      trail[i] = (trail[i+1]).get(); // get() returns a copy, not a reference
      // println("loc" + i + ": " + (trail[i]).x + "," + (trail[i]).y);
    }
    prevLoc = trail[(trailSize-3)];
  }
}


class FogGen {
  float startAngle;
  float angleVel;
  float angle;
  float alfa;

  FogGen(int alfa_, float startAngle_) {
    startAngle = startAngle_;
    angleVel = 0.1;
    alfa = alfa_;
  }

  // In order to move the wave, we start at a different theta value each frame.
  void update() {
    startAngle += 0.02;
    angle = startAngle;
  }  

  void display() {
    for (int x = 0; x <= width; x += 24) {
      float y = map(noise(angle), -1, 1, 0, height);
      stroke(240, alfa);
      strokeWeight(23);
      noFill();
      strokeCap(ROUND);
      line(x, height, x, y);
      strokeWeight(3);
      angle += angleVel;
    }
  }
}


