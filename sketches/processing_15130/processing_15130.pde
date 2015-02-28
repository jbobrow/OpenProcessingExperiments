

class Flog {
  int id;
  PVector location;
  PVector velocity;
  PVector destination;
  int greenShade;
  color skinColor;
  color origColor;
  float tongue;
  float tongueChange;
  int wing;
  int wingChange;
  float angle;
  int timer;
  boolean hasDestination;
  boolean isFrozen;
  boolean isFollowingCursor;
  int wildSpeed = 3;
  int stopSpeed = 2;
  
  Flog(int myID, int initX, int initY) {
    id = myID;
    location = new PVector(initX, initY);
    velocity = new PVector(0,-1);
    destination = new PVector(0, 0);
    greenShade = 50+int(random(100));
    origColor = color(0,greenShade,0);
    skinColor = origColor;
    tongue = int(random(10));
    tongueChange = random(-1,1)/10;
    wing = 0;
    wingChange = 5;
    angle = random(-45,45);
    isFrozen = false;
    hasDestination = false;
    isFollowingCursor = false;
    timer = 0;
  }
  
  void display() {
    skinColor = origColor;
    pushMatrix();
    translate(location.x, location.y);
    pushMatrix();
    rotate(radians(angle));
    scale(0.2);
    drawShadow();
    drawTongue();
    drawLeg(true);
    drawLeg(false);
    drawBody();
    drawEyes();
    drawWing(true);
    drawWing(false);
    
    animate();
    move();
    popMatrix();
    popMatrix();
  }
  
  void drawShadow() {
    noStroke();
    for(int i=0; i<15; i++) {
      fill(0,10);
      ellipse(0, 30, 40+4*i, 50+4*i); 
    }
  }
  
  void drawTongue() {
    noFill();
    stroke(204, 102, 204);
    strokeWeight(2);
    strokeCap(ROUND);
    line(0,-45,0,-70-10*sin(tongue));
    stroke(0);
    strokeWeight(1);
  }
  
  void drawLeg(boolean isLeft) {
    noStroke();
    fill(skinColor);
    int m = (isLeft) ? -1:1;
    
    pushMatrix();
    rotate(radians(m*wing));
    beginShape();
    curveVertex(m*10, 50);
    curveVertex(m*35, 20);
    curveVertex(m*60, 15);
    curveVertex(m*20, 45);
    curveVertex(0, 0);
    endShape();
    
    beginShape();
    curveVertex(m*20, 45);
    curveVertex(m*20, 45);
    curveVertex(m*50, 70);
    curveVertex(m*10, 48);
    curveVertex(m*10, 50);
    endShape(); 
    popMatrix(); 
  }
  
  void drawBody() {
    fill(skinColor);
    ellipse(0, 0, 80, 100); 
  }
  
  void drawEyes() {
    int eye = greenShade/4;
    float rand = 50+random(50);
    if(timer%rand>0 && timer%rand<40) {
      ellipse(-35, -20, eye, eye);
      ellipse(35, -20, eye, eye);
    }
    else {
      fill(255);
      ellipse(-35, -20, eye, eye);
      ellipse(35, -20, eye, eye);
      fill(0);
      ellipse(-35, -23, eye/2, eye/2);
      ellipse(35, -23, eye/2, eye/2);
      fill(skinColor);
      arc(-35, -20, eye, eye, 0, PI);
      arc(35, -20, eye, eye, 0, PI);
    }
  }
  
  void drawWing(boolean isLeft) {
    noStroke();
    fill(255, 50);
    int m = (isLeft) ? -1:1;
    
    pushMatrix();
    rotate(radians(-1*m*wing));
    ellipse(m*45, 10, 80, 40);
    stroke(50);
    line(m*5, 10, m*60, 10);
    popMatrix(); 
  }
  
  void animate() {
    if(!isFrozen) {
      wing += wingChange;
      if(wing > 10 || wing < -10)
        wingChange *= -1;
    }
    tongue += tongueChange;
      
    timer++;
  }
  
  void move() {
    if(!isFrozen) {
      if(hasDestination) {
        float minAngle = 0;
        float minDist = 10000;
        for(int i=0; i<5; i++) {
          float angle1 = angle+i-2;
          PVector newVel = new PVector(cos(radians(angle1-90)),sin(radians(angle1-90)));
          PVector newLoc = new PVector(location.x, location.y);
          newLoc.add(newVel);
          float dist1 = dist(newLoc.x, newLoc.y, destination.x, destination.y);
          if(dist1<minDist) {
            minDist = dist1;
            minAngle = angle1;
          }
        }
        angle = minAngle;
        
        //if(location.x>destination.x-10 && location.x<destination.x+10 && location.y>destination.y-10 && location.y<destination.y+10) {
          //isFrozen = true;
        //}
        //else {
          velocity.x = stopSpeed*cos(radians(angle-90));
          velocity.y = stopSpeed*sin(radians(angle-90));
          location.add(velocity);
          checkEdges();
        //}
      }
      else {
        angle += random(-10,10);
        velocity.x = wildSpeed*cos(radians(angle-90));
        velocity.y = wildSpeed*sin(radians(angle-90));
        location.add(velocity);
        checkEdges();
      }
    }
    if(isFollowingCursor)
      setDestination(mouseX, mouseY);
  }
  
  void setDestination(int x, int y) {
    hasDestination = true;
    isFrozen = false;
    destination.x = x;
    destination.y = y;
  }
  
  void followCursor() {
    reset();
    isFollowingCursor = !isFollowingCursor;
  }
  
  void checkEdges() {
    if (location.x > width+10)
      location.x = 0;
    else if (location.x < -10)
      location.x = width;
  
    if (location.y > height+10)
      location.y = 0;
    else if (location.y < -10)
      location.y = height;
  }
  
  PVector getLocation() {
    return location;
  }
  
  void setLocation(int x, int y) {
    location.x = x;
    location.y = y;
    destination.x = x;
    destination.y = y;
  }
  
  void reset() {
    isFrozen = false;
    hasDestination = false;
  }
  
  void printStuff() {
    println("vx: "+velocity.x);
    println("vy: "+velocity.y);
    println("angle: "+angle);
    println();
  }
}

