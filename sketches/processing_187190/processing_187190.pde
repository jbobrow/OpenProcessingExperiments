
/*
@pjs preload="xenon_ship.png"
*/

/*
 Andor Salga
 Based on Nature of Code
 */

Vehicle v;
StarBackground bg;
float lastTime = 0;

void setup() {
  size(500, 500);
  imageMode(CENTER);
  v = new Vehicle();
  bg = new StarBackground();
}

void draw() {
  background(0);    
  v.seek(mouseX, mouseY);

  float delta = (millis()/1000.0f) - lastTime;
  v.update(delta);

  bg.render();
  v.render();

  lastTime = millis()/1000.0f;
}

/*
*/
class StarBackground {
  ArrayList<PVector> smallStars = new ArrayList<PVector>();
  final int NUM_STARS = 250;

  StarBackground() {
    for (int i = 0; i < NUM_STARS; i++) {
      int randomX = (int)random(0, width);
      int randomY = (int)random(0, height);
      smallStars.add(new PVector(randomX, randomY));
    }
  }

  void render() {
    stroke(255);
    strokeWeight(1);
    for (int i = 0; i < NUM_STARS; i++) {
      PVector v = smallStars.get(i); 
      point(v.x, v.y);
    }
  }
}

/*

 */
class Vehicle {
  PVector pos;
  PVector vel;
  PVector acc;

  float maxSpeed;
  float maxForce;

  PImage img;

  Vehicle() {
    pos = new PVector(width/2, height/2);
    vel = new PVector();
    acc = new PVector();

    maxSpeed = width/4.0f;
    maxForce = 1.5f;

    img = loadImage("xenon_ship.png");
  }

  void seek(float x, float y) {
    PVector target = new PVector(x, y);
    PVector desired = PVector.sub(target, v.pos);
    desired.normalize();
    desired.mult(maxSpeed);

    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);

    applyForce(steer);
  }

  void update(float delta) {    
    vel.x += acc.x * delta;
    vel.y += acc.y * delta;

    // limit
    if (vel.mag() > maxSpeed) {
      vel.normalize();
      vel.mult(maxSpeed);
    }
    pos.add(vel);    
    
    acc.mult(0);
  }

  void applyForce(PVector f) {
    acc.add(f);
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    
    
    rotate(atan2(vel.y, vel.x)  + PI/2);
    image(img, 0, 0);
    popMatrix();
  }
}



