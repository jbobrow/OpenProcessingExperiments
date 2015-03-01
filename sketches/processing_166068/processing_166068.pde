
float oRadius, iRadius; 
int numSegments = 6; 
Star star; 
float inc; 
float hoehe; 

void setup() {
  size(540, 520); 
  background(0); 
  smooth(); 
  noStroke(); 

  oRadius = 60; 
  iRadius = oRadius/2; 
  star = new Star();
  hoehe = sqrt(3.0)/2.0 * oRadius;
}

void draw() {
  background(0);
  //fill(0, 25); 
  //rect(0, 0, width, height);  

  float factor;  
  factor = map(sin(radians(inc)), -1, 1, -0.1, 1.1);
  factor = constrain(factor, 0, 1); 

  float yStart, xStart, xStep;
  xStart = 0; 
  yStart = 0; 
  xStep = 3*oRadius/2; 

  fill(0, 150, 255, 150);
  for (float my = yStart-hoehe; my <= height+hoehe; my += hoehe) {
    for (float mx = xStart; mx <= width+oRadius; mx += 3*oRadius) { 
      pushMatrix(); 
      translate(mx, my);
      star.drawShape(0, 0, 1-factor);
      popMatrix();
    }
    xStart += xStep;
    xStep *= -1;
  }

  fill(0, 200, 200, 150);
  xStart = 0; 
  yStart = 0; 
  xStep = 3*oRadius/2; 
  for (float my = yStart-hoehe; my <= height+hoehe; my += hoehe) {
    for (float mx = xStart; mx <= width+oRadius; mx += 3*oRadius) { 
      pushMatrix(); 
      translate(mx, my);
      star.drawShape(0, 0, factor);
      popMatrix();
    }
    xStart += xStep;
    xStep *= -1;
  }

  inc += 0.5;
}

class Star {
  int numVertices = 4;
  PVector[] vStart; 
  PVector[] vGoal; 

  Star() {
    float angle = TWO_PI / numSegments; 

    vStart = new PVector[numVertices]; 
    vGoal = new PVector[numVertices];

    vStart[0] = new PVector(0, 0);
    vStart[1] = new PVector(cos(0)*oRadius, sin(0)*oRadius);
    vStart[2] = new PVector(cos(angle/2)*iRadius, sin(angle/2)*iRadius);
    vStart[3] = new PVector(cos(angle)*oRadius, sin(angle)*oRadius);

    vGoal[0] = new PVector(0, 0);
    vGoal[1] = new PVector(cos(angle/2)*oRadius, sin(angle/2)*oRadius);
    vGoal[2] = new PVector(cos(angle/2)*iRadius, sin(angle/2)*iRadius);
    vGoal[3] = new PVector(cos(angle/2)*oRadius, sin(angle/2)*oRadius);
  }

  void drawShape(float _mx, float _my, float _lFactor) {
    float angleStep = TWO_PI / numSegments; 
    float x, y; 

    pushMatrix();
    translate(_mx, _my);
    for (int j = 0; j < numSegments; j++) {       
      beginShape();
      for (int i = 0; i < numVertices; i++) {
        x = lerp(vStart[i].x, vGoal[i].x, _lFactor); 
        y = lerp(vStart[i].y, vGoal[i].y, _lFactor);
        vertex(x, y);
      }
      endShape(CLOSE);
      rotate(angleStep);
    }  
    popMatrix();
  }
}

void mouseReleased() {
  iRadius = map(mouseX, 0, width, oRadius/8, 7*oRadius/8);
  star = new Star();
}



