
Dreieck dr;  
float radius; 
float hoehe; 
boolean looping = true; 

void setup() {
  size(600, 550); 
  background(255); 
  noStroke(); 

  radius = 80; 
  hoehe = sqrt(3.0)/2.0 * radius; 
  dr = new Dreieck(radius, 60);
}

void draw() {
  background(255);
  fill(0); 

  float abstand = map((cos(radians(frameCount))), -1, 1, -3, radius+5);  
  float xStart, yStart; 
  float xStep = 3*radius/2;
  
  abstand = constrain(abstand, 2, radius); 
  xStart = 0; 
  yStart = 0; 
  for (float y = yStart-hoehe; y <= height+radius; y += hoehe) { 
    for (float x = xStart; x <= width+radius; x += radius*3) {
      for (float angle = 0; angle < 360; angle += 60) {               
        dr.drawDreieck(x, y, angle, 0, abstand);
      }
    }
    xStart += xStep;
    xStep *= -1;
  }
}

class Dreieck {
  PVector[] ecken; 
  float radius;   

  Dreieck(float _radius, float _angle) {
    float x, y; 
    float angle = 60;
    float r; 

    ecken = new PVector[3];     
    radius = _radius;      

    // Eckpunkte Dreieck
    ecken[0] = new PVector(0, 0);
    for (int i = 1; i < 3; i++) {
      x = cos(radians(angle)) * radius;
      y = sin(radians(angle)) * radius;

      ecken[i] = new PVector(x, y);   
      angle += _angle;
    }
  } 

  void drawDreieck(float _mx, float _my, float _angle, float _abstandX, float _abstandY) {
    PVector v; 

    pushMatrix(); 
    translate(_mx, _my); 
    rotate(radians(_angle)); 
    beginShape(); 
    for (int i = 0; i < 3; i++) {
      vertex(ecken[i].x + _abstandX, ecken[i].y + _abstandY);
    }
    endShape(CLOSE);
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



