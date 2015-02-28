
/*
This is the head of the creature. It does the steering,
and the segments that follow it all simply follow. It has no legs.
*/
class Head extends LegBase {
  float currentX;
  float currentY;
  float currentZ;
  PVector destination;
  int destinationTimer;
  private float velocityAdjust; // Walk slower while turning;
  private static final float VELOCITY = 1;
  private static final float TURN_RATE = 0.016;
  
  
  Head(float x, float y) {
    super(x, y);
    this.x = x;
    this.y = y;
    z = 2;
    heading = 0;
    this.x = 192 * cos(PI + heading);
    this.y = 192 * sin(PI + heading);
    this.currentX = this.x;
    this.currentY = this.y;
    destination = new PVector(-random(128), -random(128));
    destinationTimer = 0;
    leg = new Leg[0];
}
  
  
  void Update() {
    legTimer += 0.020;
    if (legTimer > 1) {
      legTimer -= 1;
    }
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
    //velocityAdjust = max(0, 1 * (1 - abs(dHeading) / PI));
    velocityAdjust = 1;
    //print("Velocity adjustment is " + velocityAdjust + "\n");
    heading = (heading + TWO_PI) % TWO_PI;
    float distance = sqrt(
      pow(destination.x - x, 2) +
      pow(destination.y - y, 2));
    
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
    
    // Time out destinations + reposition when reached
    destinationTimer ++;
    if ((distance < 44) || (destinationTimer > 720)) {
      PVector oldDestination = new PVector(destination.x, destination.y);
      distance = 0;
      while(distance < 128) {
        destination.x = 112 * (-1 + random(2));
        destination.y = 112 * (-1 + random(2));
        distance = sqrt(
          pow(destination.x - oldDestination.x, 2) +
          pow(destination.y - oldDestination.y, 2));
      }
      destinationTimer = 0;
    }
  }
  
  
  void Render() {
    //fill(255);
    pushMatrix();
    translate(x, y, z + 12);
    rotateZ(heading);
    translate(6, 0, 0);
    stroke(foregroundColor);
    //box(18, 20, 9);
    box(24, 24, 24);
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
    stroke(foregroundColor, 128);
    //line(destination.x, destination.y, 0.05, x, y, 0.05);
    
    // Target point
    float markSize = 12;
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

