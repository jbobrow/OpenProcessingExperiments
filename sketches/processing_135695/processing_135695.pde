
PVector p1, p2, p3;
PVector s1, s2, s3;
boolean bHold;

//================================================================

void setup() {
  size(800, 600);
  smooth();
  textSize(10);
  textAlign(LEFT, CENTER);
    
  p1 = new PVector(random(width), random(height));
  p2 = new PVector(random(width), random(height));
  p3 = new PVector(random(width), random(height));
  s1 = new PVector(random(-2, 2), random(-2, 2));
  s2 = new PVector(random(-2, 2), random(-2, 2));
  s3 = new PVector(random(-2, 2), random(-2, 2));
  
  bHold = false;
}

//================================================================

void draw() {
  if (!bHold) {
  background(128);
  
  //increment all three points
  p1.add(s1);
  p2.add(s2);
  p3.add(s3);
  
  //boundry checking
  if (p1.x < 0 || p1.x >= width) { s1.x *= -1; p1.x += s1.x;}
  if (p1.y < 0 || p1.y >= height) { s1.y *= -1; p1.y += s1.y;}
  if (p2.x < 0 || p2.x >= width) { s2.x *= -1; p2.x += s2.x;}
  if (p2.y < 0 || p2.y >= height) { s2.y *= -1; p2.y += s2.y;}
  if (p3.x < 0 || p3.x >= width) { s3.x *= -1; p3.x += s3.x;}
  if (p3.y < 0 || p3.y >= height) { s3.y *= -1; p3.y += s3.y;}
  
  threePointCircle(p1, p2, p3);
  }
}

//================================================================

void threePointCircle(PVector A, PVector B, PVector C) {
  PVector center = new PVector(0, 0);
  
  //get the differences...
  PVector deltaAB = PVector.sub(B, A);
  PVector deltaBC = PVector.sub(C, B);
  
  //get the slopes of those differences
  float slopeAB = deltaAB.y/deltaAB.x;
  float slopeBC = deltaBC.y/deltaBC.x;
  
  //get the midpoint (used for infinate and zero slopes)
  PVector midpointAB = new PVector((A.x+B.x)/2, (A.y+B.y)/2);
  PVector midpointBC = new PVector((B.x+C.x)/2, (B.y+C.y)/2);
  
  //get the center point - we need to handle zero deltas, too...
  if(deltaAB.y == 0) {
    center.x = midpointAB.x;
    if (deltaBC.x == 0) center.y = midpointBC.y;
    else center.y = midpointBC.y + (midpointBC.x-center.x)/slopeBC;
  }
  else if (deltaBC.y == 0) {
    center.x = midpointBC.x;
    if (deltaAB.x == 0) center.y = midpointAB.y;
    else center.y = midpointAB.y + (midpointAB.x-center.x)/slopeAB;
  }
  else if (deltaAB.x == 0) {
    center.y = midpointAB.y;
    center.x = slopeBC*(midpointBC.y-center.y) + midpointBC.x;
  }
  else if (deltaBC.x == 0) {
    center.y = midpointBC.y;
    center.x = slopeAB*(midpointAB.y-center.y) + midpointAB.x;
  }
  else {
    center.x = (slopeAB*slopeBC*(midpointAB.y - midpointBC.y) - slopeAB*midpointBC.x + slopeBC*midpointAB.x)/(slopeBC - slopeAB);
    center.y = midpointAB.y - (center.x - midpointAB.x)/slopeAB;
  }
  
  //...and don't forget the diameter
  PVector deltaACenter = PVector.sub(A, center);
  float diameter = deltaACenter.mag() * 2;
  
  //display the results  
  noFill();
  stroke(200);
  ellipse(center.x, center.y, diameter, diameter);
  
  stroke(100);
  fill(100);
  ellipse(center.x, center.y, 5, 5);
  text("Center", center.x + 10, center.y); 
  ellipse(midpointAB.x, midpointAB.y, 5, 5);
  text("midpointAB", midpointAB.x + 10, midpointAB.y);  
  ellipse(midpointBC.x, midpointBC.y, 5, 5);
  text("midpointBC", midpointBC.x + 10, midpointBC.y);
  
  line(A.x, A.y, B.x, B.y);
  line(midpointAB.x, midpointAB.y, center.x, center.y);
  line(B.x, B.y, C.x, C.y);
  line(midpointBC.x, midpointBC.y, center.x, center.y);
  
  stroke(110);
  fill(0);
  ellipse(A.x, A.y, 5, 5);
  text("A", A.x + 10, A.y);
  ellipse(B.x, B.y, 5, 5);
  text("B", B.x + 10, B.y);
  ellipse(C.x, C.y, 5, 5);
  text("C", C.x + 10, C.y);
  
  fill(0, 0, 100);
  int l = 1, sp = 15;
  text("A: " + nfc(A.x, 1) + ", " + nfc(A.y, 1), 10, sp*l++); 
  text("B: " + nfc(B.x, 1) + ", " + nfc(B.y, 1), 10, sp*l++); 
  text("C: " + nfc(C.x, 1) + ", " + nfc(C.y, 1), 10, sp*l++);
  text("∆AB: " + nfc(deltaAB.x, 1) + ", " + nfc(deltaAB.y, 1), 10, sp*l++);
  text("∆BC: " + nfc(deltaBC.x, 1) + ", " + nfc(deltaBC.y, 1), 10, sp*l++);
  text("slopeAB: " + nfc(slopeAB, 2), 10, sp*l++);
  text("slopeBC: " + nfc(slopeBC, 2), 10, sp*l++);
  text("midpointAB: " + nfc(A.x, 1) + ", " + nfc(A.y, 1), 10, sp*l++); 
  text("midpointBC: " + nfc(B.x, 1) + ", " + nfc(B.y, 1), 10, sp*l++);
  fill(255);
  text("center: " + nfc(center.x, 1) + ", " + nfc(center.y, 1), 10, sp*l++);
  fill(0, 0, 100);
  text("∆ACenter: " + nfc(deltaACenter.x, 1) + ", " + nfc(deltaACenter.y, 1), 10, sp*l++);
  fill(255);
  text("diameter: " + nfc(diameter, 2), 10, sp*l++);
}

