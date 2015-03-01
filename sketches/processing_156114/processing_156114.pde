
Dreieck dr;  
float radius; 
float hoehe; 

void setup() {
  size(600, 480); 
  background(255);
  noStroke();
  colorMode(HSB, 360, 100, 100); 

  radius = 80; 
  hoehe = sqrt(3.0)/2.0 * radius; 
  dr = new Dreieck(radius, 60);
}

void draw() {
  background(360);
  float xStart, yStart; 
  float xStep = 3*radius/2; 
  xStart = 0; 
  yStart = 0; 
  for (float y = 0; y < height+hoehe; y += hoehe) {
    for (float x = xStart; x < width+radius; x += radius*3) { 
      for (float angle = 0; angle < 360; angle += 60) {
        dr.drawDreieck(x, y, angle);
      }
    }
    xStart += xStep;
    xStep *= -1;  
  }
}

class Dreieck {
  PVector[] ecken; 
  float radius;   
  ArrayList<PVector> shape1; 
  ArrayList<PVector> shape2;
  ArrayList<PVector> shape3;
  color[] farben; 

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
    // Muster...
    shape1 = new ArrayList<PVector>();
    shape1.add(new PVector(0, 0)); 
    angle = 60;  
    for (int i = 0; i < 6; i++) {
      r = random(radius/2, hoehe); 
      x = ecken[0].x + cos(radians(angle)) * r;
      y = ecken[0].y + sin(radians(angle)) * r;

      shape1.add(new PVector(x, y));   
      angle += 12;
    }

    shape2 = new ArrayList<PVector>();
    shape2.add(new PVector(0, 0)); 
    angle = 60;  
    for (int i = 0; i < 5; i++) {
      r = random(radius/4, 2*radius/3); 
      x = ecken[0].x + cos(radians(angle)) * r;
      y = ecken[0].y + sin(radians(angle)) * r;

      shape2.add(new PVector(x, y));   
      angle += 15;
    }
    shape3 = new ArrayList<PVector>();
    shape3.add(new PVector(0, 0)); 
    angle = 60;  
    for (int i = 0; i < 4; i++) {
      r = random(radius/8, radius/2); 
      x = ecken[0].x + cos(radians(angle)) * r;
      y = ecken[0].y + sin(radians(angle)) * r;

      shape3.add(new PVector(x, y));   
      angle += 20;
    }
    // Farben
    farben = new color[3];
    for (int i = 0; i < 3; i++) {
      farben[i] = color(random(360), random(50, 100), random(50, 100));
    }
  } 

  void drawDreieck(float _mx, float _my, float _angle) {
    PVector v; 
    
    noStroke(); 
    fill(360);
    pushMatrix(); 
    translate(_mx, _my); 
    rotate(radians(_angle)); 
    beginShape(); 
    for (int i = 0; i < 3; i++) {
      vertex(ecken[i].x, ecken[i].y);
    }
    endShape(CLOSE); 
    
    fill(farben[0], 150);
    beginShape(); 
    for (int j = 0; j < shape1.size (); j++) {
      v = shape1.get(j); 
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    fill(farben[1], 150); 
    beginShape(); 
    for (int j = 0; j < shape2.size (); j++) {
      v = shape2.get(j); 
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    fill(farben[2], 150);    
    beginShape(); 
    for (int j = 0; j < shape3.size (); j++) {
      v = shape3.get(j); 
      vertex(v.x, v.y);
    }
    endShape(CLOSE);   
    popMatrix();
  }
}

void mouseReleased(){
  dr = new Dreieck(radius, 60); 
} 


