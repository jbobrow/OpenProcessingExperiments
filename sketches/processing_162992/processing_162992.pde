
/*
  Keys: 
 0 = monochrome
 1 = multi-colored
 m = match edges of each arc (ON/OFF)
 */

float mx, my, inc; 
float sAngle, rStart, rStep;
float h, s, b; 
int steps, numPoints; 
int cMode = 0; 
boolean match = false; 

void setup() {
  size(500, 500); 
  background(255);
  noStroke(); 
  noLoop(); 

  colorMode(HSB, 360, 100, 100, 100);

  mx = width/2; 
  my = height/2;

  inc = 0; 
  sAngle = 60;
  rStart = 250;
  rStep = 30;
  numPoints = 7; 
  steps = (int) rStart/ (int) rStep; 

  h = random(360);
  s = 100;
}

void draw() {
  background(360); 

  translate(mx, my); 
  drawShape();
}

void drawShape() {
  PVector[] points; 
  float radius = rStart;
  float x, y, a, r, r0;

  b = 100/ (float)steps;

  for (int j = 0; j < steps; j++) {

    points = new PVector[numPoints];
    a = 0; 
    r0 = 0; 
    for (int i = 0; i < numPoints; i++) {
      r = random(radius/2, radius); 
      x = cos(radians(a)) * r; 
      y = sin(radians(a)) * r; 
      points[i] = new PVector(x, y); 
      a += sAngle / (numPoints - 1); 
      if (i == 0) {
        r0 = r;
      }
    }
    if (match) {
      a -= sAngle / (numPoints - 1); 
      x = cos(radians(a)) * r0; 
      y = sin(radians(a)) * r0; 
      points[numPoints-1] = new PVector(x, y);
    }

    if (cMode == 0) {
      fill(h, s, b);
      //stroke(h, s, b);
    } else {
      fill(random(360), random(50, 100), random(50, 100), 80);
    } 


    for (float angle = 0; angle < 360; angle += sAngle) {
      pushMatrix(); 
      rotate(radians(angle)); 
      beginShape();
      vertex(0, 0); 
      curveVertex(points[0].x, points[0].y);
      curveVertex(points[0].x, points[0].y);
      for (int i = 0; i < numPoints; i++) {
        curveVertex(points[i].x, points[i].y);
      }
      //curveVertex(points[numPoints-1].x, points[numPoints-1].y);
      curveVertex(0, 0); 
      vertex(0, 0); 
      endShape(CLOSE); 
      popMatrix();
    }

    // mit Spiegelung (=> sAngle = 30; numPoints = 5;
    /*
    for (float angle = 0; angle < 360; angle += 2*sAngle) {
     pushMatrix(); 
     rotate(radians(angle)); 
     beginShape();
     vertex(0, 0); 
     vertex(points[numPoints-1].x, points[numPoints-1].y);
     for (int i = numPoints-1; i >= 0; i--) {
     curveVertex(points[i].x, points[i].y);
     }
     for (int i = 1; i < numPoints; i++) {
     curveVertex(points[i].x, -points[i].y);
     }
     vertex(points[numPoints-1].x, -points[numPoints-1].y);
     vertex(0, 0); 
     endShape();
     popMatrix();
     }
     */
    radius -= rStep;
    b += 100/ (float)steps;
  }
}

void mouseReleased() {
  h = random(360);
  redraw();
}

void keyReleased() {
  if ( key == '0') {
    cMode = 0;
  }
  if ( key == '1') {
    cMode = 1;
  }
  if (key == 'm' || key == 'M') {
    match = !match;
  }
  redraw();
}



