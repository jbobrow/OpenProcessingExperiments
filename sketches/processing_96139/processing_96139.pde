
/* --------------------------------------------------------------------------
 * SimpleOpenNI 3DSceneDepth 
 */
import java.util.Iterator;
import processing.opengl.*;
import SimpleOpenNI.*;

int Point = 0;

ArrayList balls;
SimpleOpenNI  kinect;
int boxSize = 60;
int radius;
Box box = new Box();
PVector boxCenter = new PVector(0, 0, 600);
PVector location, speed, acceleration, gravity;
float s=2.7;
boolean      handsTrackFlag = false;
PVector      handVec = new PVector();
ArrayList    handVecList = new ArrayList();
int          handVecListSize = 30;
String       lastGesture = "";
void setup()
{
  size(1024, 768, P3D);
  textSize(64);
  balls = new ArrayList();
  for (int i=0; i< 2;i++) {  
    radius = int(random(15, 30));
    balls.add(new Ball(radius));
  } 
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  // enable hands + gesture generation
  kinect.enableGesture();
  kinect.enableHands();

  // add focus gestures  / here i do have some problems on the mac, i only recognize raiseHand ? Maybe cpu performance ?
  //context.addGesture("Wave");
  kinect.addGesture("Click");
  kinect.addGesture("RaiseHand");
  // kinect.enableRGB();
  // kinect.alternativeViewPointDepthToImage();
  // enable depthMap generation 
  if (kinect.enableDepth() == false)
  {
    println("Can't open the depthMap, maybe the camera is not connected!"); 
    exit();
    return;
  }
}

void draw()
{
  background(255);
  // update the cam
  kinect.update();
  kinect.setMirror(true);
  //PImage rgbImage=kinect.rgbImage();
  translate(width/2, height/2, -1000);
  rotateX(radians(180));
  translate(0, 0, 1400); 
  rotateY(radians(map(mouseX, 0, width, -180, 180)));
  //rotateX(radians(mouseRotationX));
  translate (0, 0, s*-1000);
  scale(s);
  stroke(0);
  PVector [] depthPoints=kinect.depthMapRealWorld();
  int depthPointsInBox=0;
  for (int i=0;i<depthPoints.length;i+=10) {
    PVector currentPoint = depthPoints[i];
    // stroke(rgbImage.pixels[i]);
    if (currentPoint.x> boxCenter.x-boxSize/2
      && currentPoint.x< boxCenter.x+boxSize/2) {
      if (currentPoint.y> boxCenter.y-boxSize/2
        && currentPoint.y< boxCenter.y+boxSize/2) {
        if (currentPoint.z> boxCenter.z-boxSize/2
          && currentPoint.z< boxCenter.z+boxSize/2) {
          depthPointsInBox++;
        }
      }
    }
    if (handsTrackFlag) 
    point(currentPoint.x, currentPoint.y, currentPoint.z);
  }
  float boxAlpha = map(depthPointsInBox, 0, 1000, 0, 255);
  // draw the tracked hand
  if (handsTrackFlag)  
  {
    pushStyle();
    stroke(255, 0, 0, 200);
    noFill();
    Iterator itr = handVecList.iterator(); 
    beginShape();
    while ( itr.hasNext () ) 
    { 
      PVector p = (PVector) itr.next(); 
      vertex(p.x, p.y, p.z);
    }
    endShape();   

    stroke(255, 0, 0);
    strokeWeight(4);
    point(handVec.x, handVec.y, handVec.z);
    boxCenter=handVec;
    popStyle();
  }
  pushMatrix();
  translate(constrain(boxCenter.x, -box.boxsize/2+boxSize/2, box.boxsize/2-boxSize/2), 
  constrain(boxCenter.y, -box.boxsize/2+boxSize/2, box.boxsize/2-boxSize/2), 
  constrain(boxCenter.z, 0, box.boxsize*4-box.boxsize/2-boxSize));
  fill(255, 0, 0, boxAlpha);
  stroke(255, 0, 0);
  box(boxSize);
  popMatrix();
  for (int i=0; i< balls.size() -1;i++) {  
    Ball thisBall = (Ball) balls.get(i);
    gravity= new PVector(0, 0, 0.1*radius/3);
    thisBall.applyForce(gravity);
    thisBall.move();
    thisBall.display();
    thisBall.collide();
  }
  box.display();
  saveFrame();
}
void keyPressed() {
  if (keyCode==38) {
    s+=0.01;
  }
  if (keyCode==40) {
    s-=0.01;
  }
}
void mousePressed() {
  save("touchedPont.png");
}

// -----------------------------------------------------------------
// hand events

void onCreateHands(int handId, PVector pos, float time)
{
  println("onCreateHands - handId: " + handId + ", pos: " + pos + ", time:" + time);

  handsTrackFlag = true;
  handVec = pos;

  handVecList.clear();
  handVecList.add(pos);
}

void onUpdateHands(int handId, PVector pos, float time)
{
  //println("onUpdateHandsCb - handId: " + handId + ", pos: " + pos + ", time:" + time);
  handVec = pos;

  handVecList.add(0, pos);
  if (handVecList.size() >= handVecListSize)
  { // remove the last point 
    handVecList.remove(handVecList.size()-1);
  }
}

void onDestroyHands(int handId, float time)
{
  println("onDestroyHandsCb - handId: " + handId + ", time:" + time);

  handsTrackFlag = false;
  kinect.addGesture(lastGesture);
}

// -----------------------------------------------------------------
// gesture events

void onRecognizeGesture(String strGesture, PVector idPosition, PVector endPosition)
{
  println("onRecognizeGesture - strGesture: " + strGesture + ", idPosition: " + idPosition + ", endPosition:" + endPosition);

  lastGesture = strGesture;
  kinect.removeGesture(strGesture); 
  kinect.startTrackingHands(endPosition);
}

void onProgressGesture(String strGesture, PVector position, float progress)
{
  //println("onProgressGesture - strGesture: " + strGesture + ", position: " + position + ", progress:" + progress);
}

class Box {
  int boxsize = 300;

  void display() {
    pushMatrix();
    translate(0,0,boxsize*2);
    stroke(0);
    noFill();
    box(boxsize,boxsize,boxsize*3);
    rotateX(radians(180));
    //rotateY(360);
    fill(0,200,60);
    text(Point,400,0);
    popMatrix();
  }
}
class Ball {

  PVector location = new PVector();
  PVector speed = new PVector(random(1), random(1), random(4,5));
  PVector acceleration = new PVector(0, 0, 0);
  int radius; 

  Ball( int radius) {

    this.radius = radius;
    location.x = random(radius*2, box.boxsize/2-radius*2);
    location.y = random(radius*2, box.boxsize/2-radius*2);
    location.z = random(radius*2, box.boxsize*3-radius*2);
  }  

  void move() {
    //speed.y+= -gravity;
    speed.add(acceleration);
    location.add(speed);
   
    acceleration.mult(0);
    if (location.x > box.boxsize/2-radius) {
      location.x= box.boxsize/2-radius;
      speed.x*=-1;
    }
    else if (location.x < -box.boxsize/2 + radius) {
      location.x = -box.boxsize/2 +radius;
      speed.x*=-1;
    }
    if (location.y > box.boxsize/2-radius) {
      location.y = box.boxsize/2-radius ;
      speed.y*= -1;
    }
    else if (location.y < -box.boxsize/2 + radius) {
      location.y= -box.boxsize/2+radius;
      speed.y*= -1;
    }
    if (location.z > box.boxsize*4-box.boxsize/2-radius) {
      //location.z = box.boxsize*3/2-radius;
      speed.z*= -1.5;
      Point--;
    }
    else if (location.z < box.boxsize/2 + radius) {
      location.z = box.boxsize/2 + radius;
      speed.z*= -0.2;
    }
  }

  void collide() {
    for (int i=0; i < balls.size() -1; i++) {
      Ball ballA = (Ball) balls.get(i);

        if ( ballA.location.dist(boxCenter) < (ballA.radius+boxSize/2 )) {
          ballA.speed.z*= -2;
          Point++;
        }
      }
    }
  

  void display() {
    noStroke();
    fill(0);
    pushMatrix();
    translate(location.x, location.y, location.z);
    sphere(radius);
    popMatrix();
  }

  void applyForce(PVector force) {
    PVector f = force.get();  // make a copy
    f.div(radius/3);
    acceleration.add(f);
  }
}
class Box {
  int boxsize = 300;

  void display() {
    pushMatrix();
    translate(0,0,boxsize*2);
    stroke(0);
    noFill();
    box(boxsize,boxsize,boxsize*3);
    rotateX(radians(180));
    //rotateY(360);
    fill(0,200,60);
    text(Point,400,0);
    popMatrix();
  }
}
class Ball {

  PVector location = new PVector();
  PVector speed = new PVector(random(1), random(1), random(4,5));
  PVector acceleration = new PVector(0, 0, 0);
  int radius; 

  Ball( int radius) {

    this.radius = radius;
    location.x = random(radius*2, box.boxsize/2-radius*2);
    location.y = random(radius*2, box.boxsize/2-radius*2);
    location.z = random(radius*2, box.boxsize*3-radius*2);
  }  

  void move() {
    //speed.y+= -gravity;
    speed.add(acceleration);
    location.add(speed);
   
    acceleration.mult(0);
    if (location.x > box.boxsize/2-radius) {
      location.x= box.boxsize/2-radius;
      speed.x*=-1;
    }
    else if (location.x < -box.boxsize/2 + radius) {
      location.x = -box.boxsize/2 +radius;
      speed.x*=-1;
    }
    if (location.y > box.boxsize/2-radius) {
      location.y = box.boxsize/2-radius ;
      speed.y*= -1;
    }
    else if (location.y < -box.boxsize/2 + radius) {
      location.y= -box.boxsize/2+radius;
      speed.y*= -1;
    }
    if (location.z > box.boxsize*4-box.boxsize/2-radius) {
      //location.z = box.boxsize*3/2-radius;
      speed.z*= -1.5;
      Point--;
    }
    else if (location.z < box.boxsize/2 + radius) {
      location.z = box.boxsize/2 + radius;
      speed.z*= -0.2;
    }
  }

  void collide() {
    for (int i=0; i < balls.size() -1; i++) {
      Ball ballA = (Ball) balls.get(i);

        if ( ballA.location.dist(boxCenter) < (ballA.radius+boxSize/2 )) {
          ballA.speed.z*= -2;
          Point++;
        }
      }
    }
  

  void display() {
    noStroke();
    fill(0);
    pushMatrix();
    translate(location.x, location.y, location.z);
    sphere(radius);
    popMatrix();
  }

  void applyForce(PVector force) {
    PVector f = force.get();  // make a copy
    f.div(radius/3);
    acceleration.add(f);
  }
}




