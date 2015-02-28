

class Flog {
  
  static final int FLY_STATE = 0;
  static final int REST_STATE = 1;
  static final int DRAG_STATE = 2;
  static final int DRIFT_STATE = 3;
  static final int CURSOR_STATE = 4;
  static final int DEAD_STATE = 5;
  
  // essentials
  int id;
  PVector location;
  PVector velocity;
  float speed;
  float speedAngle;
  float angle;
  PVector destination;
  int stopSpeed;
  int state;
  
  // display variables
  int greenShade;
  color skinColor;
  color origColor;
  float tongue;
  float tongueChange;
  int wing;
  int wingChange;
  int blinkTimer;
  float scaleFactor;
  
  // additional functionalities
  boolean hasDestination;
  PVector originalLocation;
  boolean hasCollided;
  int lilyCounter;
  AudioPlayer player;
  
  
  Flog(int myID, int initX, int initY) {
    location = new PVector(initX, initY);
    velocity = new PVector(0,-1);
    angle = random(-45,45);
    speedAngle = random(0,2*PI);
    speed = 6*(sin(speedAngle)+1);
    stopSpeed = 5;
    id = myID;
    destination = new PVector(0, 0);
    greenShade = 50+int(random(100));
    origColor = color(0,greenShade,0);
    skinColor = origColor;
    tongue = int(random(10));
    tongueChange = random(-1,1)/10;
    wing = 0;
    wingChange = 5;
    blinkTimer = 0;
    scaleFactor = 0.1;
    hasCollided = false;
    lilyCounter = -1;
    
    player = minim.loadFile("DingLing.wav");
    player.play();
    player = minim.loadFile("fly.wav");
    player.play();
    numFlogs++;
    state = FLY_STATE;
  }
  
  void display() {
    if(state != DEAD_STATE) {
      if(state == DRAG_STATE) {
        drag(true);
        float rad = atan ((originalLocation.y-location.y)/(originalLocation.x-location.x));
        if(originalLocation.x > location.x)
          rad = (PI/2+rad);
        else
          rad = -(PI/2-rad);
        angle = degrees(rad);
      }
      skinColor = origColor;
      pushMatrix();
      translate(location.x, location.y);
      pushMatrix();
      rotate(radians(angle));
      drawCreature();
      move();
      popMatrix();
      popMatrix();
    }
  }
  
  void drawCreature() {
    scale(scaleFactor);
    if(scaleFactor < 0.5) {
      scaleFactor += 0.001;
      noStroke();
      fill(255, map(scaleFactor, 0.1, 0.5, 50, 0));
      ellipse(0,0,300,300);
    }
    drawShadow();
    if(state != DRAG_STATE)
      drawTongue();  
    drawLeg(true);
    drawLeg(false);
    drawBody();
    drawEyes();
    drawWing(true);
    drawWing(false);
    animate();
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
    int eye = greenShade/2;
    fill(255);
    
    if(state == DRAG_STATE) {
      ellipse(-35, -20, eye, eye);
      ellipse(35, -20, eye, eye);
      fill(0);
      ellipse(-35, -23, eye/2, eye/2);
      ellipse(35, -23, eye/2, eye/2);
    }
    else {
      eye = eye/2;
      float rand = 50+random(50);
      if(blinkTimer%rand>0 && blinkTimer%rand<40) {
        fill(skinColor);
        ellipse(-35, -20, eye, eye);
        ellipse(35, -20, eye, eye);
      }
      else {
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
    if(state == FLY_STATE) {
      wing += wingChange;
      if(wing > 10 || wing < -10)
        wingChange *= -1;
    }
    tongue += tongueChange;
    blinkTimer++;
  }
  
  void move() {
    if(state == FLY_STATE) {
      hasDestination = false;
      hasCollided = false;
      angle += random(-10,10);
      velocity.x = speed*cos(radians(angle-90));
      velocity.y = speed*sin(radians(angle-90));
      speedAngle = (speedAngle+0.1)%(2*PI);
      speed = 3*(sin(speedAngle)+2);
      location.add(velocity);
      checkEdges();
      checkLilies();
    }
    else if(state == CURSOR_STATE) {
      float minAngle = 0;
        float minDist = 10000;
        for(int i=-20; i<20; i+=10) {
          float angle1 = angle+i;
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
        
        velocity.x = stopSpeed*cos(radians(angle-90));
        velocity.y = stopSpeed*sin(radians(angle-90));
        location.add(velocity);
        checkEdges();
    }
    else if(state == DRIFT_STATE) {
      velocity.x *= 0.99;
      velocity.y *= 0.99;
      checkCollisions();
      location.add(velocity);
      checkEdges();
      float speed_temp = sqrt(pow(velocity.x,2) + pow(velocity.y,2));
      if(speed_temp < 1) {
        state = FLY_STATE;
        player = minim.loadFile("fly.wav");
        player.play();
      }
    }
    else if(state == REST_STATE) {
      if(lilyCounter > 0) {
        if(lilyCounter < 100)
          lilyCounter++;
        else {
          lilyCounter = -1;
          state = FLY_STATE;
          player.pause();
          player = minim.loadFile("fly.wav");
          player.play();
        }
      }
    }
    if(state == CURSOR_STATE)
      setDestination(mouseX, mouseY);
  }
  
  void checkLilies() {
    for(LilyPad l:myLilyPads) {
      if(l.onLilyPad(location) && random(1) < .1) {
        state = REST_STATE;
        lilyCounter = 1;
        l.sink();
        player.pause();
        player = minim.loadFile("bleep.wav");
        player.play();
        player = minim.loadFile("frog.wav");
        player.play();
      }
    }
  }
  
  void checkCollisions() {
    if(!hasCollided) {
      for(Flog f:myFlogs) {
        if(f.id != id && dist(f.location.x, f.location.y, location.x, location.y) < 50) {
          PVector v = f.velocity;
          f.velocity = new PVector(f.velocity.x+velocity.x, f.velocity.y+velocity.y);
          velocity = new PVector(velocity.x+v.x, velocity.y+v.y);
          toAdd.add(new Flog(myFlogs.size(),int(location.x), int(location.y)));
          toAdd.add(new Flog(myFlogs.size(),int(location.x), int(location.y)));
          hasCollided = true;
          break;
        }
      }
    }
  }
  
  void checkEdges() {
      boolean isOut = false;
      if (location.x > width-10) {
        if (state == DRIFT_STATE) {
          dies();
        }
        else {
          angle = -90;
          speed = 2;
        }
      }
      else if (location.x < 10) {
        if (state == DRIFT_STATE) {
          dies();
        }
        angle = 90;
        speed = 2;
      }
      
      if (location.y > height-10) {
        if (state == DRIFT_STATE) {
          dies();
        }
        angle = 0;
        speed = 2;
      }
      else if (location.y < 10) {
        if (state == DRIFT_STATE) {
          dies();
        }
        speed = 2;
        angle = 180;
      }
  }
  
  void setDestination(int x, int y) {
    hasDestination = true;
    destination.x = x;
    destination.y = y;
  }
  
  void followCursor() {
    if(state == CURSOR_STATE)
      state = FLY_STATE;
    else
      state = CURSOR_STATE;
  }
  
  void reset() {
    state = FLY_STATE;
  }
  
  boolean atLocation(int x, int y) {
    return (abs(location.x-x) < 50 && abs(location.y-y) < 50);
  }
  
  void drag(boolean beginDrag) {
    int x = mouseX;
    int y = mouseY;
    
    if(beginDrag) {
      if(originalLocation == null) {
        originalLocation = new PVector(location.x, location.y);
      }
      location.x = x;
      location.y = y;
      stroke(204, 102, 204);
      strokeWeight(3);
      line(originalLocation.x, originalLocation.y, location.x, location.y);

      state = DRAG_STATE;
    }
    else {
      player = minim.loadFile("boing.wav");
      player.play();
      
      velocity.x = 0.3*(originalLocation.x-location.x);
      velocity.y = 0.3*(originalLocation.y-location.y);
      reset();
      originalLocation = null;
      hasCollided = false;
      state = DRIFT_STATE;
    }
  }
  
  void release() {
    player = minim.loadFile("boing.wav");
    player.play();
    
    velocity.x = 0.3*(originalLocation.x-location.x);
    velocity.y = 0.3*(originalLocation.y-location.y);
    reset();
    originalLocation = null;
    hasCollided = false;
    state = DRIFT_STATE;
  }
  
  void dies() {
    state = DEAD_STATE;
    numFlogs--;
    player.pause();
  }
  
  void printStuff() {
    println("vx: "+velocity.x);
    println("vy: "+velocity.y);
    println("angle: "+angle);
    println();
  }
}

