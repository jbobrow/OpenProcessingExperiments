
BobSystem BobsUno;

void setup() {
  size(600, 480);
  colorMode(HSB);
  frameRate(18);
  BobsUno = new BobSystem(10);
}

void draw() {
  background(255);
  BobsUno.runBobs();
}
class Bob {
  PVector position, velocity;
  int size, fieldSize, hue;
  float radius, fieldRadius;
  
  Bob() {
    hue = int(random(0, 255));
    size = 30;
    radius = size/2;
    fieldSize = 400;
    fieldRadius = fieldSize/2;
    int x = int(random(size/2, (width-size/2)));
    int y = int(random(size/2, (height-size/2)));
//    size = int(random(0, 50));
    position = new PVector(x, y);
    velocity = PVector.random2D();
  }
  
  void update() {
    position.add(velocity);
    
    //check for walls
    if((position.x - size/2) <= 0 || (position.x + size/2) >= width){ velocity.x *= -1; }
    if((position.y - size/2) <= 0 || (position.y + size/2) >= height){ velocity.y *= -1; }
  }
  
  void display() {
    renderBob();
  }
  
  void run(ArrayList<Bob> bills) {
    update();
    intersect(bills);
    display();
  }
  
  void intersect(ArrayList<Bob> bills) {
    for(Bob other : bills) {
      float d = PVector.dist(position, other.position);
      PVector dVector = PVector.sub(other.position, position);
      
      if(d > 0){
        for(float i = fieldRadius; i > 0; i-=10) {
          for(float j = other.fieldRadius; j > 0; j-=10) {
            int areIntersecting = checkIntersect(position.x, 
                                                  position.y, 
                                                  i, 
                                                  other.position.x, 
                                                  other.position.y, 
                                                  j);
                                                  
            //If the fields are crossing and have intersection points
            if(areIntersecting == 1){
              float[] intersections = getIntersections(position.x, 
                                                      position.y, 
                                                      i, 
                                                      other.position.x, 
                                                      other.position.y, 
                                                      j);
              renderIntersectShape(intersections, dVector, i);
            }
            
            //If one of the fields is contained in the other
            if(areIntersecting == -1){
//              renderOverlapShape(i);
            }
          }
        }
      }
    }
  }
  
  void renderBob() {
    noStroke();
    fill(hue, 200, 200);
    ellipse(position.x, position.y, size, size);
  }
  
  void renderIntersectShape(float[] intersections, PVector distance, float tempSize) {
    PVector circleNormal = new PVector(radius, 0);
    PVector distIntA = new PVector(intersections[0], intersections[1]);
    PVector distIntB = new PVector(intersections[2], intersections[3]);
    float angle1, angle2;
    
    //Dots
    int dotSize = 5;
    noStroke();
    fill(hue, 200, 200, 15);
    ellipse(distIntA.x, distIntA.y, dotSize, dotSize);
    ellipse(distIntB.x, distIntB.y, dotSize, dotSize);
    
    //Arcs
    /*
    distIntA.sub(position);
    distIntB.sub(position);
    
    if(distance.x > 0){
      if(distIntA.y < distance.y){
        angle1 = getArcAngle(circleNormal, distIntA);
        angle2 = getArcAngle(circleNormal, distIntB);
      } else {
        angle1 = getArcAngle(circleNormal, distIntB);
        angle2 = getArcAngle(circleNormal, distIntA);
      }
      
      if((angle1 - PI) >  angle2){
        angle2 += TWO_PI;
      }
    } else {
      if(distIntA.y > distance.y){
        angle1 = getArcAngle(circleNormal, distIntA);
        angle2 = getArcAngle(circleNormal, distIntB);
      } else {
        angle1 = getArcAngle(circleNormal, distIntB);
        angle2 = getArcAngle(circleNormal, distIntA);
      }
      
      if((angle1 - PI) >  angle2){
        angle2 += TWO_PI;
      }
    }
    noFill();
    strokeWeight(2);
    stroke(0, 0, 0);
    arc(position.x, position.y, 2*tempSize, 2*tempSize, angle1, angle2, OPEN);
    */
    
  }
  
  void renderOverlapShape(float shapeSize){
    noFill();
    strokeWeight(2);
    stroke(0, 0, 0);
    ellipse(position.x, position.y, 2*shapeSize, 2*shapeSize);
  }
  
  void renderField() {
    stroke(100, 50);
    noFill();
    for(int i = 0; i < fieldSize; i+=20){
      ellipse(position.x, position.y, i, i);
    }
  }
}
class BobSystem {
  ArrayList<Bob> bobs;
  int bobAmount;
  
  BobSystem(int bobNumber) {
    bobs = new ArrayList<Bob>();
    bobAmount = bobNumber;
    
    for(int i = 0; i < bobAmount; i++){
      bobs.add(new Bob());
    }
  }
  
  void runBobs() {
    for(Bob b : bobs){
      b.run(bobs);
    }
  }
}
int checkIntersect(float x0, float y0, float r0, float x1, float y1, float r1) {
  int doTheyIntersect;
  float dx, dy, d;
  
  //Calculating distance between centerpoints
  dx = x1 - x0;
  dy = y1 - y0;
  d = sqrt(sq(dy)+sq(dx)); 
  
  //Using distance to determine if they intersect
  if(d > (r0 + r1)) {
    //No intersection
    doTheyIntersect = 0;
  } else if (d < abs(r0 - r1)){
    //One is contained within the other
    doTheyIntersect = -1;
  } else {
    
    //They intersect
    doTheyIntersect = 1;
  }
  
  return doTheyIntersect;
}

float[] getIntersections(float x0, float y0, float r0, float x1, float y1, float r1) {
  float dx, dy, d, a, x2, y2, h, rx, ry, xi1, xi2, yi1, yi2;
  float[] intersectionPoints = new float[4];
  
  dx = x1 - x0;
  dy = y1 - y0;
  d = sqrt(sq(dy)+sq(dx));

  a = ((r0*r0) - (r1*r1) + (d*d)) / (2.0 * d);
  x2 = x0 + (dx * a/d);
  y2 = y0 + (dy * a/d);
  h = sqrt(sq(r0) - sq(a));
  rx = (0-dy) * (h/d);
  ry = dx * (h/d);
  xi1 = x2 + rx;
  xi2 = x2 - rx;
  yi1 = y2 + ry;
  yi2 = y2 - ry;
  
  intersectionPoints[0] = xi1;
  intersectionPoints[1] = yi1;
  intersectionPoints[2] = xi2;
  intersectionPoints[3] = yi2;
  
  return intersectionPoints;
}

float getArcAngle(PVector normal, PVector intersection) {
  float angle;
  
  angle = PVector.angleBetween(normal, intersection);
  
  if(intersection.y < 0){
    angle = TWO_PI - angle;
  }
  
  return angle;
}


