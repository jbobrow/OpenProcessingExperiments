
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Jieun
// ID: 201420072

float angle;

void setup() {
  size (1024 ,768);
  smooth();
  //noLoop();
}

void draw() {
  background(18, 65, 85);
  noStroke();
  //fill(40, 99, 160, 30); 
  fill(255, 255, 0);

  for (int x1 = -70; x1 < width; x1 = x1+100) { 
    for (int y1 = 100; y1 < height ; y1 =y1+100) { 
      pushMatrix();
      translate(x1, y1);
      if (mousePressed) rotate(radians(float(mouseX)/2));
      else rotate(radians(angle));
      scale(float(mouseY)/700);
      triangle (0, 0, (0 + 50), ( 0-100), (0 +100), 0);
      popMatrix();
    }
  }

  for (int x1 = 0; x1 < width; x1 = x1+100) {
    for (int y1 = 0; y1 < height ; y1 = y1+100) { 
      pushMatrix();
      translate(x1, y1);
      if (mousePressed) rotate(-radians(float(mouseX)/2));
      else rotate(-radians(angle));
      scale(float(mouseY)/700);
      triangle (0, 0, (0 + 50), ( 0-100), (0 +100), 0);
      popMatrix();
    }
  }
  angle+=0.3;
  }

