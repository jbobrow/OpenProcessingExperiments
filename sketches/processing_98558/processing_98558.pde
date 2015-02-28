
import processing.pdf.*;

import toxi.geom.*;

ArrayList<Float> angles = new ArrayList<Float>();
ArrayList<PVector> vectorACNormList = new ArrayList<PVector>();
ArrayList<PVector> bisector = new ArrayList<PVector>();
ArrayList points=new ArrayList();
int timer=0;

boolean showLine=true;
boolean showSpline=true;
boolean showHandles=true;

PVector pointB = new PVector();
PVector pointA = new PVector();
PVector vectorBC = new PVector();
PVector vectorBA = new PVector();
PVector vectorACNorm = new PVector();

void setup() {
  size(600, 600);
  beginRecord(PDF, "laserMe.pdf" ); 
  smooth();
}

void draw() {
  background(255);
  noFill();
  int numP=points.size();
  int numA=angles.size();
  PVector pointC=new PVector(mouseX, mouseY);

  if (mousePressed) {
    actOnMousePressed(numP, pointC, pointB);
    timer = millis();
  }

  numP=points.size();
  drawVector(numP);
  drawPoints(numP);
  drawAngles(numA);
}

void drawAngles(int numA) {
  if (numA>0) {
    if (showLine) {
      stroke(255, 55, 0, 50);
      beginShape();
      for (int i=0; i<numA; i++) {
        PVector p=(PVector)points.get(i+1);
        PVector b=(PVector)bisector.get(i);
        float a=(float)angles.get(i);
        PVector vecN=(PVector)vectorACNormList.get(i);
        float aSplit=a/2;
        float perpendicularSlope = -1/((b.y-p.y)/(b.x-p.x));
        float bee = p.y-p.x*perpendicularSlope;
        float xIntercept=-bee/perpendicularSlope;
        float yIntercept=bee;
        float curAngle=atan2(abs(xIntercept-p.x),p.y);
        float xShift=sin(curAngle)*60;
        float yShift=cos(curAngle)*60;
        //y=mx+b
        //x=(y-b)/m
        //y=perpendicularSlope(x)+bee
       // line(p.x-xShift, p.y-yShift,p.x+xShift, p.y+yShift);
        int cutLength=50;
        float offSet =(cutLength/(sqrt(pow(perpendicularSlope,2)+1)));
        line(p.x-offSet,(p.x-offSet)*perpendicularSlope+bee,p.x+offSet,(p.x+offSet)*perpendicularSlope+bee);
      }
      endShape();
    }
    endShape();
  }
}

void drawVector(int numP) {
  if (showLine) {
    stroke(255, 55, 0, 50);
    beginShape();
    for (int i=0; i<numP; i++) {
      PVector p=(PVector)points.get(i);
      vertex(p.x, p.y);
    }
    endShape();
  }
}

void drawPoints(int numP) {
  stroke(0);
  // highlight the positions of the points with circles
  PVector[] handles=new PVector[numP];
  beginShape();

  for (int i=0; i<numP; i++) {
    PVector p=(PVector)points.get(i);
    handles[i]=p;
    if (showHandles) ellipse(p.x, p.y, 5, 5);    
    vertex(p.x, p.y);
  }
  endShape();
}

void actOnMousePressed(int numP, PVector pointC, PVector pointB)
{
  //print(millis()-timer);
  if (numP > 0 && (millis()-timer > 100))
  {
    points.add(pointC);   
    pointB=(PVector)points.get(numP-1);
    println("Points b ");
    print(pointB);

    println("Points c ");
    print(pointC);

    if (numP >1) {
      pointA=(PVector)points.get(numP-2);

      println("Points a ");
      print(pointA);

      pointB=(PVector)points.get(numP-1);
      vectorBA.set(pointA.x-pointB.x, pointA.y-pointB.y, 0);
      vectorBC.set(pointC.x-pointB.x, pointC.y-pointB.y, 0);
      println("set vec BA");
      print(vectorBA);
      println("set vec BC");
      print(vectorBC);
      vectorBC.normalize();
      vectorBA.normalize();
      println("set vec BA");
      print(vectorBA);
      println("set vec BC");
      print(vectorBC);


      PVector curBisector = new PVector(((vectorBC.x+vectorBA.x)/2)+pointB.x, ((vectorBC.y+vectorBA.y)/2)+pointB.y, 0)    ;  
      bisector.add(curBisector);

      //vectorACNorm.set(vectorBA.x-vectorBC.x,vectorBA.y-vectorBC.y,0.0); 

      vectorACNorm = PVector.sub(vectorBA, vectorBC);
      vectorACNormList.add(vectorACNorm);

      println("set vec AC");
      print(vectorACNorm);
      println("the Heading is:");
      print(degrees(vectorACNorm.heading()));
      vectorACNormList.add(vectorACNorm);
      float a=acos(vectorBA.dot(vectorBC)/ (vectorBA.mag()*vectorBC.mag() ));
      if (a<0) { 
        a+=TWO_PI;
      }
      println("the Angle Between is");
      print(degrees(a));
      angles.add(degrees(a));
    }
  }
  else if (numP == 0)
    points.add(pointC);
}

void keyPressed() {
  if (key=='h') showHandles=!showHandles;
  else if (key=='l') showLine=!showLine;
  else if (key=='s') showSpline=!showSpline;
  else if (key=='p') endRecord();

  else points.clear();
}

float myAngleBetween (PVector myPVector1, PVector myPVector2) {
  float a=acos(myPVector1.dot(myPVector2)/ (myPVector1.mag()*myPVector2.mag() ));
  //float a = atan2(myPVector1.y-myPVector2.y, myPVector1.x-myPVector2.x);
  if (a<0) { 
    a+=TWO_PI;
  }
  return a;
}



