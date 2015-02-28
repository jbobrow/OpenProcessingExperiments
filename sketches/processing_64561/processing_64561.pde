
ArrayList allPoints;
ArrayList allHues;

void setup() {
  size(500, 500);
  allPoints = new ArrayList();
  smooth();
  colorMode(HSB);
}


void draw() {
  background(200);

  noFill();
  for (int i=0;i<allPoints.size();i++) {
    Node aNode =(Node) allPoints.get(i);
    aNode.draw();
    aNode.fadeOut();
    aNode.wander(allPoints);
  }
  //kill off some!
  if (frameCount==0) {
    if (allPoints.size()>1) {
      for (int i=0;i<allPoints.size()/4;i++) {
        Node aNode =(Node) allPoints.get((int)random(allPoints.size()-1));
        aNode.markedForDeath=true;
      }
    }
  }
  for (int i=0;i<allPoints.size();i++) {
    Node aNode =(Node) allPoints.get(i);
    if (!aNode.alive) {
      allPoints.remove(i);
    }
  }
}


int returnNearestPoint(PVector aPoint, int thisIndex) {
  int index=0;
  float closestDist=width+height;
  for (int i=0;i<allPoints.size();i++) {
    if (i!=thisIndex) {
      PVector thisPoint=(PVector) allPoints.get(i);
      float thisDist = dist(thisPoint.x, thisPoint.y, aPoint.x, aPoint.y);
      if (thisDist<closestDist) {
        //println("closestPoint "+ i+" "+allPoints.size());
        closestDist=thisDist;
        index=i;
      }
    }
  }

  return index;
}

void mouseMoved() {
  if (frameCount%4==0) {
    PVector thisPoint = new PVector(mouseX, mouseY);
    Node aNode = new Node(thisPoint, random(183, 211));

    allPoints.add(aNode);
    //allHues.add(random(100,255));
  }
}

class Node {

  boolean alive=true;
  boolean markedForDeath=false;
  PVector pos;
  float hue;
  float fade=0;
  float rad=random(30, 100);
  float wrad=30;
  boolean addNodes=true;
  int fadeSpeed=2;
  ArrayList wanderLine;
  Node( PVector aPos, float aHue  ) {
    pos=aPos;
    hue=aHue;
    wanderLine=new ArrayList();
    wanderLine.add(new PVector(pos.x, pos.y));

    float angle= random(TWO_PI);
    float x =wrad*sin(angle);
    float y=wrad*cos(angle);
    wanderLine.add(new PVector(pos.x+x, pos.y+y));
  }
  void draw() {
    fill(hue, 255, 255, 255-fade);
    noStroke();
    ellipse(pos.x, pos.y, rad, rad);
    PVector lastPoint = (PVector)wanderLine.get(1);
  }
  void fadeOut() {
    //if this node has been tagged start fadeing out
    if (markedForDeath) {
      fade+=fadeSpeed;
    }
    //if we are completely faded out tag for removal
    if (fade>=255) {
      alive=false;
    }
  }
  void wander(ArrayList otherNodes) {
    noFill();
    stroke(hue, 255, 255, 255-fade);
    
    //if we don't have enough nodes yet
    if (addNodes) {
      //check the lenght = if we are too long stop adding nodes next time
      if (wanderLine.size()>=50) {
        addNodes=false;
      }
      
      //check for other nodes near to us and finish on this one if we are near
      for (int i=0;i<otherNodes.size();i++) {
        Node otherNode=(Node)otherNodes.get(i);
        PVector otherPos= otherNode.pos;
        PVector lastPoint = (PVector)wanderLine.get(wanderLine.size()-1);
        int tol=60;
        if (dist(otherPos.x, otherPos.y, lastPoint.x, lastPoint.y)<tol && otherPos!=pos) {
          wanderLine.add(otherPos);
          addNodes=false;
        }
      }

      PVector lastPoint = (PVector)wanderLine.get(wanderLine.size()-1);
      PVector secondToLastPoint = (PVector)wanderLine.get(wanderLine.size()-2);
      float suby=lastPoint.y-secondToLastPoint.y;
      float subx=lastPoint.x-secondToLastPoint.x;
      float prevAngle = atan2(  lastPoint.y-secondToLastPoint.y, lastPoint.x-secondToLastPoint.x);
      float wanderAmount=1.9;
      float currentAngle=random(prevAngle-wanderAmount, prevAngle+wanderAmount);

      float x =wrad*cos(currentAngle);
      float y=wrad*sin(currentAngle);

      wanderLine.add(new PVector(lastPoint.x+  x, lastPoint.y+  y));
    }
    
    //draw the wandering lines
    strokeWeight(1);
    beginShape();
    PVector aPoint = (PVector) wanderLine.get(0);
    curveVertex(aPoint.x, aPoint.y);
    for (int i=0;i<wanderLine.size();i++) {
      PVector thisPoint = (PVector) wanderLine.get(i);
      curveVertex(thisPoint.x, thisPoint.y);
    }
    endShape();
  }
}
