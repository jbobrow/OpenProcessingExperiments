
PVector newPoint;
PVector oldPoint;
PVector rotationPoint;
float lerpValue = 1;
boolean debug = true;

void setup() {
  size(600, 600);
  smooth();
  newPoint = new PVector(40, 20);  // these coordinates aren't used
}

void draw() {
  background(0);
  if (lerpValue >= 1) {
    lerpValue = 0;
    newPoint.set(320, 50, 0);
    oldPoint = new PVector(newPoint.x, newPoint.y, newPoint.z);
    newPoint.set(350, 350, 0);
  }
  //makeTriangle();
  calculateAngle();
  if (debug == true)
  {
    mainPointsDebug();
  }
}

void mainPointsDebug()
{
  fill(255, 0, 0);
  noStroke();
  ellipse(oldPoint.x, oldPoint.y, 8, 8);
  text("oldPoint", oldPoint.x+20, oldPoint.y);
  fill(0, 255, 0);
  ellipse(newPoint.x, newPoint.y, 8, 8);
  text("newPoint", newPoint.x+20, newPoint.y);
  fill(0, 0, 255);
  ellipse(rotationPoint.x, rotationPoint.y, 8, 8);
  text("rotationPoint", rotationPoint.x+20, rotationPoint.y); 
  fill(255);
  stroke(255);
}

void calculateAngle()
{
  PVector calcRotation = new PVector();
  PVector findAngle = new PVector();
  float tO;
  float tA;
  float tAngle;
  float calcA;
  float calcO;
  PVector findProportions = new PVector();
  float beginRotation = 0;
  float endRotation = 0;
  rotationPoint = new PVector();
    
  float rx = newPoint.x + (cos(atan2(oldPoint.y-newPoint.y, oldPoint.x-newPoint.x)-PI/3) * dist(newPoint.x, newPoint.y, oldPoint.x, oldPoint.y));
  float ry = newPoint.x + (sin(atan2(oldPoint.y-newPoint.y, oldPoint.x-newPoint.x)-PI/3) * dist(newPoint.x, newPoint.y, oldPoint.x, oldPoint.y));  
  rotationPoint.set(rx, ry, 0);
  
  if (oldPoint.x > rotationPoint.x && oldPoint.y < rotationPoint.y
    && newPoint.x > rotationPoint.x && newPoint.y > rotationPoint.y)
  {
 //   if(oldPoint.x < newPoint.x && oldPoint.y < newPoint.y){
      calcRotation.set(newPoint.x, rotationPoint.y, 0);  
      // Find the angle of the triangle using SOHCAHTOA
      // aTan(angle) = Opposite / Hypotenuse
      // aTan(angle) = (findAngle.x - oldPoint.x) / (findAngle.y - newPoint.y)
      // angle = aTan((findAngle.x - oldPoint.x) / (findAngle.y - newPoint.y));
      findAngle.set(calcRotation.x, oldPoint.y, 0);
  
      tO = abs(oldPoint.x-findAngle.x);
      tA = abs(newPoint.y-findAngle.y);
      tAngle = atan(tO/tA);
  
      // use tAngle to calculate Opposite
      calcA = abs(calcRotation.y - newPoint.y);
      calcO = calcA * tan(tAngle);
  
  
      findProportions.set(calcRotation.x-calcO, calcRotation.y, 0);
  
      float distOldPoint = PVector.dist(findProportions, oldPoint);
      float distNewPoint = PVector.dist(findProportions, newPoint);
      float distFromOldNew = PVector.dist(oldPoint, newPoint);  
      float propDistOld = distOldPoint/distFromOldNew;
      float propDistNew = distNewPoint/distFromOldNew;
  
      beginRotation = -(60*propDistOld);
      endRotation = 60*propDistNew;    
      
      if (debug == true)
      {
        fill(255,128,0);
        text("OP.x > RP.x && OP.y < RP.y && NP.x > && NP.y > RP.Y", 10,15);
        fill(255);
        ellipse(findAngle.x, findAngle.y, 8, 8);
        line(findAngle.x, findAngle.y, calcRotation.x, calcRotation.y);
        line(findAngle.x, findAngle.y, oldPoint.x, oldPoint.y); 
  
        ellipse(calcRotation.x, calcRotation.y, 8, 8);
        line(calcRotation.x, calcRotation.y, newPoint.x, newPoint.y);
  
        line(calcRotation.x, calcRotation.y, findProportions.x, findProportions.y);
        ellipse(findProportions.x, findProportions.y, 4, 4);
  
        noFill();
        ellipse(rotationPoint.x, rotationPoint.y, distFromOldNew*2, distFromOldNew*2);
        fill(255);
        
        line(oldPoint.x, oldPoint.y, newPoint.x, newPoint.y); 
        line(newPoint.x, newPoint.y, rotationPoint.x, rotationPoint.y);
        line(oldPoint.x, oldPoint.y, rotationPoint.x, rotationPoint.y);
        println("oldToNew: " + distFromOldNew);  
        println("rotateToNew: " + PVector.dist(rotationPoint, newPoint));
        println("rotateToOld: " + PVector.dist(rotationPoint, oldPoint));
    //  }
    }
  } 


  float moveParticle = lerp(beginRotation, endRotation, lerpValue);
  pushMatrix();
  translate(rotationPoint.x, rotationPoint.y);
  rotate(radians(moveParticle));
  float distanceTravelPoints = PVector.dist(rotationPoint, oldPoint);
  float distanceOldPoint = PVector.dist(rotationPoint, oldPoint);
  // println(distanceOldPoint);
  // println(distanceTravelPoints); 
  ellipse(distanceTravelPoints, 0, 12, 12);
  lerpValue += (PVector.dist(newPoint, oldPoint))/150000;
  stroke(255);
  popMatrix();
}
