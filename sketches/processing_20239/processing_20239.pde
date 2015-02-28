
static final boolean DEBUG = false;

static final int SIZE = 75;
static final int BLACK = 0;
static final int WHITE = 255;


Harry monster;
Harry monsterTwo;
Harry monsterThree;

void setup() {
  size(500, 500);
  smooth();
  frameRate(30);

  monster = new Harry();
  monsterTwo = new Harry();
  monsterThree = new Harry();
}

void draw() {

  background(WHITE);

  monster.setInterest(mouseX, mouseY);
  monster.go();
  monsterTwo.setInterest(mouseX, mouseY);
  monsterTwo.go();
  monsterThree.setInterest(mouseX, mouseY);
  monsterThree.go();
}

/*
 ---------
 Utilities
 ---------
 */

void showVector(PVector vector, color lineColor) {
  stroke(lineColor);
  strokeWeight(3);
  PVector magnified = PVector.mult(vector, 10);
  line(0, 0, magnified.x, magnified.y);
}


float diffAngle(float from, float to) {
  float diff = to - from;
  while (diff < -PI) diff += TWO_PI;
  while (diff > PI) diff -= TWO_PI;
  return diff;
}

void rotatePVector(PVector pv, float angle) {
  float magnitude = pv.mag();
  float currentAngle = pv.heading2D();
  float newAngle = currentAngle + angle;
  pv.set((float) magnitude*cos(newAngle), (float) magnitude*sin(newAngle), 0.0);
}

/*
 -------
 Monster
 -------
 */

class Harry {
  color furColor = #000000;

  ArrayList hair = new ArrayList();

  PVector position; // coords
  PVector globalInterest; // coords
  PVector localInterest; // coords

  PVector desire; // force
  PVector velocity; // force
  float orientation; // angle of velocity

  float maxSpeed;
  float maxTurn;
  float repulseStrength;
  float repulseReach;
  float attractStrength;
  float attractReach;

  Harry() {
    position = new PVector(random(SIZE, width-SIZE), random(SIZE, height-SIZE));
    globalInterest = new PVector(position.x, position.y);
    localInterest = new PVector(0, 0);

    velocity = new PVector(0, 0);
    desire = new PVector(0, 0);

    // TODO maybe these should be a function of size (to seem mass-like)
    maxSpeed = 4.0;
    maxTurn = 0.1;

    repulseStrength = 18.0;
    repulseReach = 150;

    attractStrength = 1.1;
    attractReach = 400;

    initHair();
  }

  void setInterest(float x, float y) {
    globalInterest.x = x;
    globalInterest.y = y;

    localInterest.x = x - position.x;
    localInterest.y = y - position.y;
    rotatePVector(localInterest,  PI-orientation-PI);  // someone want to explain why PI-x-PI != x?
  }

  void go() {
    seek(globalInterest);
    fear(globalInterest);
    refresh();
    hardBounds();
    render();
    desire.mult(0);
  }

  void refresh() {
    // dismantle desire vector
    float desireSpeed = desire.mag();
    float desireTheta = desire.heading2D();

    // limit speed
    desireSpeed = constrain(desireSpeed, 0, maxSpeed);

    // rotate only when moving
    if (desireSpeed > 0) {
      // limit turn
      float currentTheta = velocity.heading2D();
      float thetaDelta = diffAngle(currentTheta, desireTheta);
      thetaDelta = constrain(thetaDelta, -maxTurn, maxTurn);
      desireTheta = currentTheta + (thetaDelta/2 + (thetaDelta/2 * desireSpeed/maxSpeed)); // weighted by speed

      // reassemble desire directly into velocity vector
      velocity.set((float) desireSpeed*cos(desireTheta), (float) desireSpeed*sin(desireTheta), 0.0);
      // set "global" theta
      orientation = desireTheta - HALF_PI;  // "down" (y-positive) is forward
    }

    position.add(velocity);
  }

  void hardBounds() {
    float radius = SIZE/2;
    position.x = constrain(position.x, radius, width-radius);
    position.y = constrain(position.y, radius, height-radius);
  }

  void fear(PVector repulsor) {
    float distance = PVector.dist(position, repulsor);
    if (distance <= repulseReach) {
      PVector away = PVector.sub(position, repulsor);
      away.normalize();
      away.mult(pow(1-(distance/repulseReach),2)*repulseStrength);

      desire.add(away);
    }
  }

  void seek(PVector attractor) {
    float distance = PVector.dist(position, attractor);
    if (distance <= attractReach) {
      PVector toward = PVector.sub(attractor, position);
      toward.normalize();
      toward.mult(pow(1-(distance/attractReach),1)*attractStrength);

      desire.add(toward);
    }
  }

  void render() {
    fill(furColor);
    stroke(0);
    ellipse(position.x, position.y, SIZE, SIZE);

    pushMatrix();
    {
      translate(position.x,position.y);

      rotate(orientation);

      // left
      renderEye(-SIZE*0.15, SIZE*0.25);      
      // right
      renderEye(SIZE*0.15, SIZE*0.25);

      if (DEBUG) {
        showVector(desire, #0000FF);
        showVector(velocity, #00FF00);
        stroke(#00FF00);
        ellipseMode(CENTER);
        ellipse(localInterest.x, localInterest.y, 2, 2);
      }
    }
    popMatrix();

    keepHair();
    renderHair();
  }

  void renderEye(float x, float y) {
    pushMatrix();
    {
      translate(x, y);

      fill(WHITE);
      stroke(0);

      ellipse(0, 0, SIZE*0.15, SIZE*0.18);

      // pupil
      pushMatrix();
      {
        PVector towardInterest = new PVector(localInterest.x, localInterest.y); // relative to body center, but good enough
        towardInterest.normalize();
        towardInterest.mult(5);

        pushMatrix();
        {
          translate(towardInterest.x, towardInterest.y);
          fill(BLACK);
          ellipse(0, 0, 6, 8);
        }
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }

  void initHair() {
    float radius = SIZE/2;

    float variance;
    float arclength = 0;
    int hairNumber = 0;
    float hairLength;
    float strandTheta;
    float strandLocalX, strandLocalY;
    float strandGlobalX, strandGlobalY;

    pushMatrix();
    {
      translate(position.x,position.y);
      rotate(orientation);

      while (arclength < radius * TWO_PI) {
        variance = noise(hairNumber * 2);

        strandTheta = arclength/radius;

        strandLocalX = radius*cos(strandTheta);
        strandLocalY = radius*sin(strandTheta);
        strandGlobalX = screenX(strandLocalX, strandLocalY);
        strandGlobalY = screenY(strandLocalX, strandLocalY);

        HairStrand strand = new HairStrand(strandGlobalX, strandGlobalY, strandTheta, variance);

        arclength += strand.arc;

        hair.add(strand);
        hairNumber++;
      }
    }
    popMatrix();
  }

  /* move all the roots to stay on our surface */
  // TODO consolidate with initHair(), too similar
  void keepHair() {
    float radius = SIZE/2;

    float arclength = 0;
    float strandTheta;
    float strandLocalX, strandLocalY;
    float strandGlobalX, strandGlobalY;
    HairStrand strand;

    pushMatrix();
    {
      translate(position.x,position.y);
      rotate(orientation);

      for (int i=hair.size()-1; i >= 0; i--) {
        strand = (HairStrand) hair.get(i);

        strandTheta = -arclength/radius;

        strandLocalX = radius*cos(strandTheta);
        strandLocalY = radius*sin(strandTheta);
        strandGlobalX = screenX(strandLocalX, strandLocalY);
        strandGlobalY = screenY(strandLocalX, strandLocalY);

        strand.moveRoot(strandGlobalX, strandGlobalY, orientation+strandTheta);

        arclength += strand.arc;
      }
    }
    popMatrix();
  }

  void renderHair() {
    float radius = SIZE/2;

    HairStrand strand;

    for (int i=hair.size()-1; i >= 0; i--) {
      strand = (HairStrand) hair.get(i);

      strand.straighten();
      // strand.seek(globalInterest);
      strand.render(furColor);
    }
  }
}

/*
 ---
 Fur   
 ---
 */

class HairStrand {
  float theta;
  float length;
  float weight;
  float arc;
  PVector root;
  PVector halfway;
  PVector tip;
  PVector tipVelocity;
  PVector tipDesire;
  float tipMaxSpeed;

  HairStrand(float x, float y, float newTheta, float variance) {
    root = new PVector(x, y);
    theta = newTheta;
    length = 5 + (5 * (variance % 5)) + (20 * variance);
    weight = .75;
    arc = .3;
    if (DEBUG) arc = arc * 10;

    tip = new PVector(root.x+(length*cos(theta)), root.y+(length*sin(theta)), 0.0);
    float halfLength = length/2;
    halfway = new PVector(root.x+(halfLength*cos(theta)), root.y+(halfLength*sin(theta)), 0.0);
    tipMaxSpeed = sq(length)/500;

    tipVelocity = new PVector(0,0);
    tipDesire = new PVector(0,0);
  }

  void moveRoot(float x, float y, float newTheta) {
    root.set(x, y, 0.0);
    theta = newTheta;

    float halfLength = length/2;
    halfway = new PVector(root.x+(halfLength*cos(theta)), root.y+(halfLength*sin(theta)), 0.0);

    /* pull tip along */
    PVector pull = PVector.sub(tip, halfway);
    pull.limit(length/2);
    tip = PVector.add(halfway, pull);
  }

  void straighten() {
    PVector straightTip = new PVector(root.x+(length*cos(theta)), root.y+(length*sin(theta)), 0.0);
    PVector toward = PVector.sub(straightTip, tip);
    float distance = toward.mag();
    toward.normalize();
    toward.mult(20/length); // shorter is stiffer
    toward.limit(distance/100);

    tipVelocity.add(toward);
  }

  // unused (doesn't feel right yet)
  void seek(PVector attractor) {
    float attractReach = 250;
    float distance = PVector.dist(tip, attractor);
    if (distance <= attractReach) {
      PVector toward = PVector.sub(attractor, tip);
      toward.normalize();
      toward.mult(20/distance);
      toward.mult(pow(1-(distance/attractReach),1)*1);

      tipVelocity.add(toward);
    }
  }

  void render(color strandColor) {
    tipVelocity.limit(1); // shorter is stiffer
    tip.add(tipVelocity);

    noFill();
    strokeWeight(weight);

    if (DEBUG) {
      stroke(#0000FF);
      line(root.x,root.y, halfway.x,halfway.y);
      stroke(#FF0000);
      line(halfway.x,halfway.y, tip.x,tip.y);
    } 
    else {
      stroke(strandColor);
      bezier(root.x,root.y, halfway.x,halfway.y, halfway.x,halfway.y, tip.x,tip.y);
    }
  }
}


