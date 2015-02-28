
ArrayList<PVector> points;

int NumberOfPoints = 12;

void setup() {
  size(800, 800, P3D);

  points = new ArrayList<PVector>();

  for (int i = 0; i < NumberOfPoints; i++) {
    PVector p = new PVector(random(-width/2, width/2), random(-height/2, height/2), random(-width/2, width/2));
    points.add(p);
  }
}


void draw() {
  background(0);

  noFill();
  stroke(255);
  strokeWeight(2);

  float progressX = map(frameCount, 0, width*8, 0, 1);
  //  float progressX = map(mouseX, 0, width, 0, 1);
  //  float progressY = map(mouseY, 0, height, 0, 1);
  float progressY = map(frameCount, 0, height*10, 0, 1);
  //  println(progressX);

  // Den Pfad entlang gehen
  float progressMove = map(mouseX, 0, width, 0, points.size()-3);
  println(progressMove);

  int index = floor(progressMove);

  PVector startPoint = points.get(index +1);
  PVector endPoint = points.get(index + 2);
  PVector PointBeforeStart = points.get(index);
  PVector PointAfterEnd = points.get(index+3);

  // Arbeitsfläche drehen
  translate(width/2, height/2);
  lights();
  rotateY(lerp(0, TWO_PI, progressX));
  rotateX(lerp(0, TWO_PI, progressY));
  scale(0.75, 0.75, 0.75);

  beginShape();
  for (int i = 0; i < points.size(); i++) {
    PVector p = points.get(i);
    stroke(255, 32);
    vertex(p.x, p.y, p.z);
//    if (i == points.size()-1) {
//      p = points.get(0);
//      vertex(p.x, p.y, p.z);
//    }
  }
  endShape();
  
  beginShape();
  for (int i = 0; i < points.size(); i++) {
    PVector p = points.get(i);
    stroke(255);
    curveVertex(p.x, p.y, p.z);
  }
  endShape();

  // Aktive Line zeichnen
  pushMatrix();
  stroke(0, 0, 255, 128);
  line(startPoint.x, startPoint.y, startPoint.z, endPoint.x, endPoint.y, endPoint.z);
  popMatrix();

  float x = lerp(startPoint.x, endPoint.x, progressMove-index);
  float y = lerp(startPoint.y, endPoint.y, progressMove-index);
  float z = lerp(startPoint.z, endPoint.z, progressMove-index);

  pushMatrix();
  noStroke();
  fill(0,0,255, 128);
  translate(x, y, z);
  sphere(6);
  popMatrix();
  
  //Aktive Kurve Zeichnen
  
  float xCurve = curvePoint(PointBeforeStart.x, startPoint.x, endPoint.x, PointAfterEnd.x, progressMove-index);   
  float yCurve = curvePoint(PointBeforeStart.y, startPoint.y, endPoint.y, PointAfterEnd.y, progressMove-index);
  float zCurve = curvePoint(PointBeforeStart.z, startPoint.z, endPoint.z, PointAfterEnd.z, progressMove-index);

  pushMatrix();
  noStroke();
  fill(255, 0, 0);
  translate(xCurve, yCurve, zCurve);
  sphere(8);
  popMatrix();
  
  for (int i = 0; i < points.size(); i++) {
    PVector p = points.get(i);

    pushMatrix();
    noStroke();
    if (p == startPoint) {
      fill(0, 255, 0);
    }
    else {
      fill(255);
    }
    translate(p.x, p.y, p.z);
    sphere(3);
    popMatrix();
  }
}



