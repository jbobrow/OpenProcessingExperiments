
class Psyche {
  color c;
  float diam;
  PVector loc, vel, acc;

  PVector force;
  float mass;
  float G;

  float step;

  float a;


  boolean auraFocus;
  float focusAngle;
  float focusDir;
  float focusDirStart;
  float focusDirEnd;

  float auraEmp;
  float auraAlph;

  float auraInt;
  int auraIntSpan;
  int auraIntRate;
  int auraIntMin;
  int auraIntMax;

  float auraDiam;
  int auraDiamSpan;
  int auraGrowRate;
  int auraGrowMin;
  int auraGrowMax;

  int fate; // decide the chosen one for hugging
  boolean hugs; // switch hugging process
  boolean endHug;
  float lastHug; // time save for last hug
  float lastHugged; // time save for last time hugged
  float refresh; // refresh counter till next hug is possible
  float refreshCount;

  int distThreshold; // tolerance


  Psyche(PVector loc) {
    this.loc = loc;
    this.vel = new PVector(random(-1, 1), random(-1, 1));
    this.diam = 8;
    this.acc = new PVector(0, 0);
    this.c = color(0);
    this.a = random(10000);

    this.auraFocus = false;
    this.focusAngle = 30;

    this.auraEmp = 1;
    this.auraAlph = 60; //60

    this.auraInt = 20;
    this.auraIntSpan = 600;
    this.auraIntRate = 5;
    this.auraIntMin = 5;
    this.auraIntMax = 80;

    this.auraDiam = 20; // 60
    this.auraDiamSpan = 600;
    this.auraGrowRate = 10;
    this.auraGrowMin = 20;
    this.auraGrowMax = 500;

    this.hugs = false;
    this.endHug = false;
    this.refresh = 0;
    this.refreshCount = 200;
    this.mass = 1;
    this.G = 0.4; // 0.4
    this.lastHug = 0;
    this.lastHugged = 0;
    this.distThreshold = 40;
  }

  void display() {

    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }

  void update() {

    if (!hugs) {
      vel.rotate(map(noise(a), 0, 1, -radians(5), radians(5)));
    } 
    else {
      vel.add(acc);
    }

    loc.add(vel);
    acc.mult(0);

    edges();

    a+=0.08;
  }

  void aura(boolean[] inFocus, int focusCount) {

    for (int i = 0; i < focusCount; i++) {
      if (inFocus[i]) {
        auraFocus = true;
        break;
      }
      else { 
        auraFocus = false;
      }
    }

    if (frameCount - lastHugged > auraDiamSpan && auraDiam > auraGrowMin) {
      auraDiam -= auraGrowRate;
      lastHugged = frameCount;
    }

    if (frameCount - lastHug > auraIntSpan && auraInt > auraIntMin) {
      auraInt -= auraIntRate;
      lastHug = frameCount;
    }

    focusDir = vel.heading();
    focusDirStart = focusDir - radians(focusAngle/2);
    focusDirEnd = focusDir + radians(focusAngle/2);

    for (float r = auraDiam; r > diam; r-=5) {  
      float refreshInt = constrain(refresh, 160, refreshCount);
      fill(auraEmp, map(refreshInt, refreshCount, 160, 100, auraInt), 
      map(refreshInt, refreshCount, 160, 100, auraInt), map(r, auraDiam, diam, 0, auraAlph));

      ellipse(loc.x, loc.y, r, r);
      fill(auraEmp, 0, 100, map(r, auraDiam, diam, 0, 60) ); // +auraDiam/8
      arc(loc.x, loc.y, r, r, focusDirStart, focusDirEnd);
    }
        
  }


  void attract(Psyche chosenOne) {
    PVector attrForce = PVector.sub(chosenOne.loc, loc);
    float d = attrForce.mag();

    d = constrain(d, 0.2, 1.0); // constrain(d,5.0,25.0);

    attrForce.normalize();

    float strength = (G * mass * chosenOne.mass) / (d * d);
    attrForce.mult(strength);

    applyForce(attrForce);

    // HUG END:
    if (dist(loc.x, loc.y, chosenOne.loc.x, chosenOne.loc.y) < (diam/2 + chosenOne.diam/2)+distThreshold ) { // +60
      hugs = false; // hugging process ends here
      endHug = true;
      refresh = refreshCount; // how long till next hug possible?
//      if(chosenOne.refresh == 0 && !chosenOne.hugs) chosenOne.refresh = chosenOne.refreshCount;
      lastHug = frameCount;
      vel = new PVector(random(-1, 1), random(-1, 1));
      if ( auraInt <= auraIntMax) auraInt += auraIntRate;
      if ( chosenOne.auraDiam <= auraGrowMax) chosenOne.auraDiam += auraGrowRate;
    }
  }

  void applyForce(PVector f) {
    PVector force = PVector.div(f, mass);
    acc.add(force);
  }

  boolean focusDetect(Psyche alter) {

    if (IsCircleInsideArc(alter.loc.x, alter.loc.y, alter.auraDiam, 
    loc.x, loc.y, auraDiam, focusDirStart, focusDirEnd)) {
      return true;
    }
    else {
      return false;
    }
  }

  void edges() {
    if (loc.x > width) {
      loc.x = width;
      vel.x *= -1;
    } 
    else if (loc.x < 0) {
      loc.x = 0;
      vel.x *= -1;
    }

    if (loc.y > height) {
      loc.y = height;
      vel.y *= -1;
    } 
    else if (loc.y < 0) {
      loc.y = 0;
      vel.y *= -1;
    }
  }

  // Get any angle, between -infinite and +infinite, and clamp it between 0 and 2*PI
  float normalizeAngle(float angle)
  {
    // First, limit it between -2*PI and 2*PI, using modulo operator
    float na = angle % (2 * PI);
    // If the result is negative, bring it back to 0, 2*PI interval
    if (na < 0) na = 2*PI + na;
    return na;
  }

  boolean IsCircleInsideArc(float circleX, float circleY, float circleD, 
  float centerX, float centerY, float d, float angle1, float angle2)
  {
    // Find if the mouse is close enough of center
    boolean nearCenter = sqrt(sq(circleX - centerX) + sq(circleY - centerY)) <= d /2 + circleD/2;
    if (!nearCenter)
      return false; // Quick exit...

    // Normalize angles (<- doesn't work in conjunction with addition of aC)
    float na1 = angle1; // normalizeAngle(angle1);
    float na2 = angle2; // normalizeAngle(angle2);
    // Find the angle between the point and the x axis from the center of the circle
    float a = atan2(circleY - centerY, circleX - centerX); // normalizeAngle(atan2(circleY - centerY, circleX - centerX));
    // Find the angle that needs to be added to match the diameter of the other circle
    float aC = tan( (circleD/2)/dist(centerX, centerY, circleX, circleY) );

    boolean between;
    // First case: small arc, below half of circle
    if (na1 < na2)
    {
      // Just check we are between these two angles
      between = na1 <= a+aC && a-aC <= na2;
    }
    else  // Second case: wide arc, more than half of circle
    {
      // Check we are NOT in the remaining (empty) area...
      between = !(na2 <= a && a <= na1);
    }
    return between;
  }
}


