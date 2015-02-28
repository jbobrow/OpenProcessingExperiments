
void setup() {
  size(1000,600);
  smooth();
  colorMode(HSB);
  background(0);
  frameRate(30);
  maxMass = height/6;
  visualWeight = 0;
}

int limit = 40;
int current = 0;
boolean rebound = true;
Asteroid[] a1 = new Asteroid[limit];
float acceleration = 0.00003;
boolean backgroundOn = true;
int initialMass = 4;
float friction = 0.6;
float gravity = 0.0;
float rememberGrav = gravity;
int maxMass;
boolean collisions = true;
float visualWeight;
float maxVisualWeight = 295.0;

int mouseIx, mouseIy, mouseFx, mouseFy;

void draw() {
    if (backgroundOn==true) {
      noStroke();
      fill(0,170);
      rect(0,0,width,height);
  }
  for (int i=0;i<current;i++) {
    for (int j=0;j<current; j++) {
      if (i!=j) {
        float angle = atan2(a1[j].yPos-a1[i].yPos,a1[j].xPos-a1[i].xPos);
        float radius = dist(a1[i].xPos,a1[i].yPos,a1[j].xPos,a1[j].yPos);
        if (radius-2 > (a1[i].mass+a1[j].mass)/2) {
          float xForce = cos(angle)*acceleration*((a1[j].trueMass*a1[i].trueMass)/radius);
          float yForce = sin(angle)*acceleration*((a1[j].trueMass*a1[i].trueMass)/radius);
          a1[i].xSpeed += xForce/a1[i].trueMass;
          a1[i].ySpeed += yForce/a1[i].trueMass;
      } else {
        PVector collision = new PVector(a1[i].xPos+(cos(angle)*(a1[i].mass/2)),a1[i].yPos+(sin(angle)*(a1[i].mass/2)));
        stroke(255,a1[i].mass,255);
        strokeWeight(8);
        point(collision.x,collision.y);
        if (collisions == true) {
           a1[i].collision(a1[j],angle);
        }
      }
    }
  }
  }
  for (int j=0;j<=maxMass;j++) {
    for (int i=0;i<current;i++) { 
      if (a1[i].mass==j) {
        a1[i].update();
      }
    }
  }
  
  if (mousePressed==true) {
    strokeWeight(1);
    if (mouseButton == RIGHT) {
      if (current<limit-1 && visualWeight + initialMass <= maxVisualWeight) {
        Asteroid potentialAsteroid = new Asteroid(initialMass,mouseX,mouseY,0,0);
        if (spaceTaken(potentialAsteroid) == false) {
        stroke(255);
        } else {
          stroke(255,255,255);
        }
      } else {
        stroke(255,255,255);
      }
      line(mouseIx,mouseIy,mouseX,mouseY);
    } else if (mouseButton == LEFT) {
       float angle = atan2(mouseY-mouseIy,mouseX-mouseIx);
       float radius = dist(mouseIx,mouseIy,mouseX,mouseY);
       float weightedRadius = constrain(radius,initialMass,maxMass);
      float xCentre = mouseIx + cos(angle)*(constrain(radius,1,maxMass)/2);
      float yCentre = mouseIy + sin(angle)*(constrain(radius,1,maxMass)/2);
      strokeWeight(weightedRadius);
      if (current<limit-1 && visualWeight + weightedRadius <= maxVisualWeight) {
        Asteroid potentialAsteroid = new Asteroid((int)weightedRadius,xCentre,yCentre,0,0);
          if (spaceTaken(potentialAsteroid) == false) {
            stroke(255);
          } else {
              stroke(255,255,255);
          }
      } else {
        stroke(255,255,255);
      }
      point(xCentre,yCentre);
    }
  }
  
}

class Asteroid {
  int mass;
  float xPos, yPos, xSpeed, ySpeed, trueMass, prevXspeed, prevYspeed, addXspeed, addYspeed;

  Asteroid(int m, float x, float y, float sx, float sy) {
    mass = m;
    xPos = x;
    yPos = y;
    xSpeed = sx;
    ySpeed = sy;
    trueMass = (4/3)*PI*pow(mass,3);
    prevXspeed = xSpeed;
    prevYspeed = ySpeed;
    addXspeed = 0;
    addYspeed = 0;
  }
  
  void update() {
    xSpeed += addXspeed;
    ySpeed += addYspeed;
    ySpeed += gravity;
    addXspeed = 0;
    addYspeed = 0;
    if (rebound==true) {
    if (xPos+xSpeed-(mass/2)<=0 || xPos+xSpeed+(mass/2)>=width){
          xSpeed *= -1*friction;
          ySpeed *= friction;
    }
    if (yPos+ySpeed-(mass/2)<=0 || yPos+ySpeed+(mass/2)>=height){
       if (gravity != 0 && ySpeed < 3*abs(gravity)) {
          ySpeed = 0;
          xSpeed *= friction;         
       } else {
          ySpeed *= -1*friction;
          xSpeed *= friction;
       }
      }
    }

    xPos += xSpeed;
    yPos += ySpeed;
    
    if (rebound==false) {
      if (xPos>width) {
          xPos -= width;
        } else if (xPos<0) {
          xPos += width;
        }
        if (yPos>height) {
          yPos -= height;
        } else if (yPos<0) {
          yPos += height;
        }
    }
    for (int i=0;i<=mass;i++) {
      strokeWeight(mass-i);
      stroke(map(mass,initialMass,maxMass,20,255),155,map(i+1,0,mass,60,255));
      point(xPos,yPos);
    }
    prevXspeed = xSpeed;
    prevYspeed = ySpeed;
  }
  
  void collision(Asteroid j, float a) {

    Asteroid J = j;
    float angle = a;
    
    float angleJ = atan2(yPos-J.yPos,xPos-J.xPos);
    float inSpeedMagnitudeJ = dist(0,0,J.prevXspeed,J.prevYspeed);
    float inSpeedAngleJ = atan2(J.prevYspeed,J.prevXspeed);
    float colliderAngleJ = inSpeedAngleJ - angleJ;
    float inSpeedMagnitude = dist(0,0,prevXspeed,prevYspeed);
    float inSpeedAngle = atan2(prevYspeed,prevXspeed);
    float colliderAngle = inSpeedAngle - angle;
    float velI = cos(colliderAngle)*inSpeedMagnitude;
    float velJ = cos(colliderAngleJ)*inSpeedMagnitudeJ*-1;
    float colliderSpeedX = (velI*(trueMass-J.trueMass)+2*J.trueMass*velJ)/(trueMass+J.trueMass);
    float colliderSpeedY = sin(colliderAngle)*inSpeedMagnitude;
    float outSpeedAngle = atan2(colliderSpeedY,colliderSpeedX)+angle;
    float outSpeedMagnitude = dist(0,0,colliderSpeedX,colliderSpeedY);

    addXspeed += cos(outSpeedAngle)*outSpeedMagnitude - xSpeed;
    addYspeed += sin(outSpeedAngle)*outSpeedMagnitude - ySpeed;
        
  }
}

boolean spaceTaken(Asteroid a) {
  boolean result = false;
    for (int j=0;j<current; j++) {
      float radius = dist(a.xPos,a.yPos,a1[j].xPos,a1[j].yPos);
      if (radius-2 <= (a.mass+a1[j].mass)/2) {
      result = true;
      j = current;
    }
  }
  return result;
}

void mousePressed() {
    mouseIx = mouseX;
    mouseIy = mouseY;
}

void mouseReleased() {
    if (current<limit-1) {
  mouseFx = mouseX;
  mouseFy = mouseY;
  float angle = atan2(mouseFy-mouseIy,mouseFx-mouseIx);
  float radius = dist(mouseIx,mouseIy,mouseFx,mouseFy);
  float weightedRadius = constrain(radius,initialMass,maxMass);
    if (mouseButton == LEFT && visualWeight + weightedRadius <= maxVisualWeight) {
      float xCentre = mouseIx + cos(angle)*(weightedRadius/2);
      float yCentre = mouseIy + sin(angle)*(weightedRadius/2);
        if (xCentre+(constrain(radius,1,maxMass)/2)>width) {
          xCentre -= xCentre+(weightedRadius/2)-width;
        } else if (xCentre-(weightedRadius/2)<0) {
          xCentre -= xCentre-(weightedRadius/2);
        }
        if (yCentre+(constrain(radius,1,maxMass)/2)>height) {
          yCentre -= yCentre+(weightedRadius/2)-height;
        } else if (yCentre-(weightedRadius/2)<0) {
          yCentre -= yCentre-(weightedRadius/2);
        }
        Asteroid potentialAsteroid = new Asteroid((int)weightedRadius,xCentre,yCentre,0,0);
        if (spaceTaken(potentialAsteroid) == false) {
          a1[current] = potentialAsteroid;
          visualWeight += a1[current].mass;
          current++;
      }
    } else if (mouseButton == RIGHT  && mouseIsIn() && visualWeight + initialMass <= maxVisualWeight) {
      float xMouse = cos(angle)*radius*0.1;
      float yMouse = sin(angle)*radius*0.1;
      Asteroid potentialAsteroid = new Asteroid(initialMass,mouseX,mouseY,xMouse,yMouse);
      if (spaceTaken(potentialAsteroid) == false) {
          a1[current] = potentialAsteroid;
          visualWeight += a1[current].mass;
          current++;
      }
    }
    }
}


void keyPressed() {
  
  if (key=='r' || key=='R') {
    current = 0;
    a1 = new Asteroid[0];
    a1 = new Asteroid[limit];
    visualWeight = 0;
} else if (key=='b' || key=='B') {
    if (backgroundOn==true) {
      backgroundOn = false;
    } else {
      backgroundOn = true;
    }
} else if (key=='m' || key=='M') {
    if (rebound==true) {
      rebound = false;
      rememberGrav = gravity;
      gravity = 0;
    } else {
      rebound = true;
      gravity = rememberGrav;
    }
  } else if (key=='c' || key=='C') {
    if (collisions==true) {
      collisions = false;
    } else {
      collisions = true;
    }
  } else if (key==CODED) {
    if (keyCode == DOWN&&rebound;==true) {
       gravity = constrain(gravity+.1,-1.0,1.0); 
    } else if (keyCode == UP&&rebound;==true){
       gravity = constrain(gravity-.1,-1.0,1.0);
    } else if (keyCode == RIGHT){
       acceleration = constrain(acceleration+0.00001,0,0.00013);
    } else if (keyCode == LEFT){
       acceleration = constrain(acceleration-0.00001,0,0.00013);
    }
  }
}

boolean mouseIsIn() {

  if (mouseX>=0 && mouseX<=width && mouseY>=0 && mouseY<=height) {
    return true;
  } else {
    return false;
  }

}
