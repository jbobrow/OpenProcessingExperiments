
/*
This is a creature with legs. It is not physically simulated
at all. It simply stores an absolute position for each foot, 
and as the creature's position shifts it checks to see if the
feet have fallen outside of an acceptable radius. When a foot 
hits the edge of this circle, it takes a step forward.
*/
class Creature {
  float x;
  float y;
  float z;
  float currentX;
  float currentY;
  float currentZ;
  PVector wobbleVelocity = new PVector(); 
  private float heading = 0;
  PVector destination;
  private float velocityAdjust; // Walk slower while turning;
  private Leg leg[]; // Array of Leg objects
  int legsUp;
  private static final float VELOCITY = 0.8;
  private static final float TURN_RATE = 0.01;
  
  
  Creature(float x, float y) {
    this.x = x;
    this.y = y;
    z = 24;
    heading = -PI / 2 * int(random(3));
    this.x = 256 * cos(PI + heading);
    this.y = 256 * sin(PI + heading);
    this.currentX = this.x;
    this.currentY = this.y;
    destination = new PVector();
    leg = new Leg[6];
    float legLength = 32;
    float baseWidth = 8;
    leg[0] = new Leg(this, baseWidth, 8, 20, 40);
    leg[1] = new Leg(this, -baseWidth, 8, -20, 40);
    leg[2] = new Leg(this, baseWidth, 0, legLength, 0);
    leg[3] = new Leg(this, -baseWidth, 0, -legLength, 0);
    leg[4] = new Leg(this, baseWidth, -8, 20, -40);
    leg[5] = new Leg(this, -baseWidth, -8, -20, -40);
    /*
        leg = new Leg[8];
    float legLength = 32;
    float baseWidth = 8;
    leg[0] = new Leg(this, baseWidth, 8, 20, 40);
    leg[1] = new Leg(this, -baseWidth, 8, -20, 40);
    leg[2] = new Leg(this, baseWidth, 8 / 3, legLength, 20);
    leg[3] = new Leg(this, -baseWidth, 8 / 3, -legLength, 20);
    leg[4] = new Leg(this, baseWidth, -8 / 3, legLength, -20);
    leg[5] = new Leg(this, -baseWidth, -8 / 3, -legLength, -20);
    leg[6] = new Leg(this, baseWidth, -8, 20, -40);
    leg[7] = new Leg(this, -baseWidth, -8, -20, -40);
    */
  }
  
  
  void Update() {
    // Update heading
    float targetHeading = atan2(
      destination.y - y, destination.x - x);
    float dHeading = (targetHeading - heading + 8 * TWO_PI) 
      % TWO_PI;
    if (dHeading > PI) {
      dHeading -= TWO_PI;
    }
    if (dHeading < -TURN_RATE) {
      heading -= TURN_RATE;
    }
    else if (dHeading > TURN_RATE) {
      heading += TURN_RATE;
    }
    velocityAdjust = max(0, -3.0 + 4.0 * (1 - abs(dHeading) / PI));
    //print("Velocity adjustment is " + velocityAdjust + "\n");
    heading = (heading + TWO_PI) % TWO_PI;
    float distance = sqrt(
      pow(destination.x - x, 2) +
      pow(destination.y - y, 2));
    if (distance < 16) {
      destination.x = 128 * (-1 + random(2));
      destination.y = 128 * (-1 + random(2));
    }
    
    // Walk forward
    float dX = cos(heading);
    float dY = sin(heading);
    x += dX * velocityAdjust * VELOCITY;
    y += dY * velocityAdjust * VELOCITY;
    
    // Check if legs are within radius
    float turnDirection = 0;
    if (abs(dHeading) > PI / 4) {
      turnDirection = dHeading / abs(dHeading);
    }
    //print("Turn direction is " + int(turnDirection) + "\n");
    for (int i = 0; i < leg.length; i ++) {
      leg[i].Update(int(turnDirection));
    }
    
    // Body wobble
    /* 
    The center point (which the feet use to position themselves)
    moves quite regularly, but the body wobbles around as it
    tries to follow the center point
    */
    PVector acceleration = new PVector(
      x - currentX, y - currentY, z - currentZ);
    acceleration.normalize();
    acceleration.mult(0.03);
    wobbleVelocity.add(acceleration);
    wobbleVelocity.mult(0.99);
    currentX += wobbleVelocity.x;
    currentY += wobbleVelocity.y;
    currentZ += wobbleVelocity.z;
  }
  
  
  void Puppeteer(float turnAmount, float forward, float lateral) {
    // Walk forward
    float dX = forward * cos(heading) + lateral * sin(heading);
    float dY = forward * sin(heading) + lateral * cos(heading);;
    x += dX * VELOCITY;
    y += dY * VELOCITY;
    heading += turnAmount * TURN_RATE;
    print("Velocity = " + dX + ", " + dY + "\n");
    // Check if legs are within radius
    /*
    if (abs(dHeading) > PI / 4) {
      turnDirection = dHeading / abs(dHeading);
    }
    */
    //print("Turn direction is " + int(turnDirection) + "\n");
    if (forward > 0) {
      turnAmount = 0; // Don't use turn-appropriate goal points if we're walking while turning
    }
    for (int i = 0; i < leg.length; i ++) {
      leg[i].Update(int(turnAmount));
    }
    
    // Body wobble
    /* 
    The center point (which the feet use to position themselves)
    moves quite regularly, but the body wobbles around as it
    tries to follow the center point
    */
    PVector acceleration = new PVector(
      x - currentX, y - currentY, z - currentZ);
    acceleration.normalize();
    acceleration.mult(0.03);
    wobbleVelocity.add(acceleration);
    wobbleVelocity.mult(0.99);
    currentX += wobbleVelocity.x;
    currentY += wobbleVelocity.y;
    currentZ += wobbleVelocity.z;
  }
  
  
  void Render() {
    //fill(255);
    pushMatrix();
    translate(currentX, currentY, currentZ + 4);
    rotateZ(heading);
    stroke(255);
    //strokeWeight(2);
    //box(18, 20, 9);
    box(16, 16, 8);
    /*
    translate(0, -4, 0);
    stroke(127, 0, 0);
    box(16, 8, 8);
    translate(0, 8, 0);
    stroke(0);
    box(16, 8, 8);
    */
    popMatrix();
    
    // Render legs
    for (int i = 0; i < leg.length; i ++) {
      leg[i].Render();
    }
    
    // Line to destination
    strokeWeight(1);
    stroke(255, 128);
    //line(destination.x, destination.y, 0.05, x, y, 0.05);
    
    // Target point
    float markSize = 8;
    pushMatrix();
    translate(destination.x, destination.y, 0.05);
    
    line(
      - markSize,
      - markSize,
      markSize,
      markSize);
    line(
      markSize,
      - markSize,
      - markSize,
      markSize);
    
    popMatrix();
  }
}

