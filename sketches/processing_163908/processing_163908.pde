
Dreieck dr;             // Triangle
float inc;
float mx, my;
float sLength, dHeight;  
boolean looping = true; 

void setup() {
  size(500, 500); 
  background(255);
  smooth();  
 
  sLength = 50;        // side length triangle
  dHeight = sqrt(3.0)/2.0 * sLength; // height triangle
  dr = new Dreieck(sLength);
  inc = 0; 
}

void draw() {
  background(0); 

  fill(255); 
  stroke(255); 
  
  float x, y; 
  float xStart = 0; 
  int counter = 0;
  
  for (my = 0; my <= height+dHeight; my += dHeight*2) {
    if (counter%2 == 0) {
      xStart = 0;
    } else {
      xStart = -sLength;
    }
    for (mx = xStart; mx <= width+sLength; mx += sLength*2) {  
      // Triangles are arranged in a circle
      for (float angle = 0; angle < 360; angle += 60) {
        x = mx + cos(radians(angle)) * sLength;
        y = my + sin(radians(angle)) * sLength;
        dr.drawDreieck(x, y, angle+inc);  
      }
    }
    counter++; 
  }

  inc += 0.65;
}

class Dreieck {
  PVector[] ecken;     // triangle vertices
  float seite;         // side length

  Dreieck(float _seite) {
    float x, y; 

    ecken = new PVector[3];    
    seite = _seite; 

    ecken[0] = new PVector(0, 0);
    ecken[1] = new PVector(seite, 0);
    x = cos(radians(-60)) * seite;
    y = sin(radians(-60)) * seite;
    ecken[2] = new PVector(x, y);
  }

  void drawDreieck(float _ex, float _ey, float _rotAngle) {
    pushMatrix();
    // rotate triangle around one edge
    translate(_ex, _ey); 
    rotate(radians(_rotAngle));  
    beginShape(); 
    for (int i = 0; i < 3; i++) {
      vertex(ecken[i].x, ecken[i].y);
    }
    endShape(CLOSE) ;
    popMatrix();
  }
}

void mouseReleased() {
  looping = !looping; 
  if (looping) {
    loop();
  } else {
    noLoop();
  }
}


