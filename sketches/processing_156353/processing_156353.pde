
/*  
 A simply fish tank created without images. Most of the code is creating the fish so don't be intimidated to read it.
 I use "shapes" to make eash part of the fish (head, body and tail) using vertex's.
 
 The movement of the body is from using angles. Because sin(theta) values are between -1 and 1, we can get a lifelike
 wiggle to represent the muscle movements of the fish.
 */

ArrayList fishTank = new ArrayList();

void setup() {
  size(640, 640);
  fill(0);
  /* Helps performance and adds a spike effect on the tails */
  noStroke();
  for (int i = 0; i < 15; i++) {
    fishTank.add(new Fish(new PVector(random(width), random(height)), random(0.1, 0.7)));
  }
}

void draw() {
  background(0, 150, 255);
  for (int i = 0; i < fishTank.size(); i++) {
    Fish f = (Fish) fishTank.get(i);
    f.moveFish();
    f.createFish();
  }
}

class Fish {
  PVector loc;
  PVector vel;
  PVector acc;
  PVector newLoc;

  int fishWidth = 60;
  int fishHeight = 200;
  float bodyAngle;
  float size;

  Fish(PVector loc, float s) {
    this.loc = loc;
    newLoc = new PVector(random(0, width), random(0, height));
    vel = new PVector(0, 0);
    size = s;
    acc = new PVector(s, s);
  }

  void createFish() {
    /* Like atan2() this gets us the value of the heading of the fish */
    float theta = vel.heading2D();
    pushMatrix();
    translate(loc.x, loc.y);
    /* Scales the size of the fish */
    scale(size);
    /* 
     Rotates the direction of the fishes heading. The fish was first designed to face up. So we rotate the fish 
     by 80 to fix the problem of the fish facing the wrong way it is heading.
     */
    rotate(theta-80);
    
    /* You will see I +10 on the second vertex. This gives the back strip pattern. */
    /* FISH HEAD */
    for (int h = 0; h < 30; h+=5) {
      beginShape();
      vertex(-h, h);
      vertex(h, h+10);

      vertex(h, h);
      vertex(-h, h+10);
      endShape();
    }
    /* Below head. */
    translate(0, 28);
    /* FISH BODY */
    for (int w = 0; w < fishHeight; w+=5) {
      float x = map(sin(radians(w)), -1, 1, -20, fishWidth);
      float y = w*2;
      float angle = sin(radians(y+frameCount*5))*w/30;

      /* So we can transfer the body movement to the tail */
      if (w == fishHeight-5) {
        bodyAngle = angle;
      }
      /* This makes the body. */
      beginShape();
      vertex(-x-angle, w-10);
      vertex(x-angle, w+10);

      vertex(x-angle, w-10);
      vertex(-x-angle, w+10);  
      endShape();
    }

    /* FISH TAIL */
    translate(0, 250);
    for (int t = -fishWidth; t < fishWidth+fishWidth/2; t+=5) {
      float x = map(sin(radians(t)), -1, 1, 5, fishWidth);
      float y = x*2;
      /* We transfer the body wiggle to the tail */
      float angle = bodyAngle*2.8+sin(radians(y+frameCount*5))*t/5;

      /* The split that makes the tail */
      if (x > fishWidth-fishWidth/2) {
        /* Left split */
        beginShape();
        vertex(-x-angle, t);
        vertex(-x+(fishWidth/2)-t/3-angle, t);

        vertex(-x+(fishWidth/2)-t/3-angle, t);
        vertex(-x-angle, t+10);
        endShape();

        /* Right split */
        beginShape();
        vertex(x-angle, t);
        vertex(x-(fishWidth/2)+t/3-angle, t);

        vertex(x-(fishWidth/2)+t/3-angle, t);
        vertex(x-angle, t+10);
        endShape();
      }
      else {
        /* The end of the tail that doesn't need to be split */
        beginShape();
        vertex(-x-angle, t);
        vertex(x-angle, t+10);

        vertex(x-angle, t);
        vertex(-x-angle, t+10);
        endShape();
      }
    }
    popMatrix();
  }

  void moveFish() {
    /* 
     Because of the way the fish finds its new location, we have to set an area around that new location where it 
     can generate a new one. This prevents the fish from continuously cirlcing its destination, unable to reach it.
     */
    if (PVector.dist(loc, newLoc) < 35) {
      makeAnotherNewLoc();
    }
    else {
      PVector dir = PVector.sub(newLoc, loc);
      dir.normalize();
      /* Strength of rotation to next location */
      dir.mult(0.05);
      acc = dir;

      vel.add(acc);
      /* The smaller the fish the faster it can go */
      vel.limit(2-size*2);
      loc.add(vel);
    }
  }

  void makeAnotherNewLoc() {
    newLoc = new PVector(random(0, width), random(0, height));
  }
}



