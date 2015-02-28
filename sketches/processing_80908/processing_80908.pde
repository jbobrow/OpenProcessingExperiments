
class creeper {
   
  ArrayList vinePoints = new ArrayList();
  color vineColor = color(70, 200, 100);
  int vineLength;
  float angleSpread;
  float angleOffset;
  int sectionLength;
   
  creeper(PVector start, float spread, float offset, int len) {
     
    vinePoints.add(start);
    angleSpread = spread;
    angleOffset = offset;
    sectionLength = len;
    float growAngle = ((random(angleSpread) - (angleSpread / 2)) + angleOffset) + 180;
    float growLength = round(random(sectionLength) + round(sectionLength / 2));
    int tempx = round(growLength * sin(radians(growAngle)));
    int tempy = round(growLength * cos(radians(growAngle)));
     
    PVector newPoint = new PVector(tempx, tempy);
    newPoint.add(start);
     
    vinePoints.add(newPoint);
     
  }
 
  void grow() {
     
    vineLength = vinePoints.size() - 1;
    PVector prevPoint = (PVector) vinePoints.get(vineLength);
    println(vineLength);
    if ((prevPoint.x > -width/2) && (prevPoint.x < width/2) && (prevPoint.y > -height)) {
     
      float growAngle = ((random(angleSpread) - (angleSpread / 2)) + angleOffset) + 180;
      float growLength = round(random(20) + 10);
      int tempx = round(growLength * sin(radians(growAngle)));
      int tempy = round(growLength * cos(radians(growAngle)));
       
      PVector newPoint = new PVector(tempx, tempy);
       
      newPoint.add(prevPoint);
       
      vinePoints.add(newPoint);
       
      if (vineLength > 2) {
        float forktest = random(10);
        if (forktest > 8) {
          sprout();
        }
      }
    }
  }
   
  void show() {
    beginShape();
    for (int i = 0; i < vinePoints.size(); i++) {
      PVector newPoint = (PVector) vinePoints.get(i);
      curveVertex(newPoint.x, newPoint.y);
    }
    endShape();
  }
   
  void sprout() {
    vineLength = vinePoints.size() - 1;
    PVector prevPoint1 = (PVector) vinePoints.get(vineLength);
    PVector prevPoint2 = (PVector) vinePoints.get(vineLength - 1);
    float newAngle = PVector.angleBetween(prevPoint1, prevPoint2);
    int newLen = round(sectionLength * 0.6);
    vines.add(new creeper(prevPoint1, angleSpread * 1.1, (angleOffset * 1.1) + (random(40) - 20), newLen));
  }
 
}


