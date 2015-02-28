
float sizeadjust = 1;
float xdeg = 0;
int iterations;

void setup() {
  size(640, 360, P3D);
}

void draw() {
  background(0);
  lights();
  translate(width / 2, height / 2);
  rotateY(map(mouseX*2, 0, width, 0, PI));
  rotateZ(map(mouseY*2, 0, height, 0, -PI));
  noStroke();
  fill(255, 255, 255);
  translate(0, -40, 0);
  drawCylinder(150, 5, 30, 20, .05); 
  
  scale(sizeadjust);
  
  if (mousePressed && (mouseButton == LEFT)) {
    sizeadjust = sizeadjust + .05;
  } else if (mousePressed && (mouseButton == RIGHT)) {
    sizeadjust = sizeadjust - .05;
  }
}

void drawCylinder(float topRadius, float tall, int sides, int iterations, float degreechange) {
  scale(sizeadjust);
  
  float[] randoms = new float[sides + 1];
  float[] randoms2 = new float[sides + 1];
  float[] yx = new float[sides + 2];
  float[] y1 = new float[sides + 1];
  float[] y2 = new float[sides + 1];
  
  yx[0] = 0;
  
  
  for (int i = 0; i < sides + 1; ++i) {
    randoms[i] = (1 - abs((sin(((TWO_PI / sides)*i) )))*noise(i*.01)) * topRadius;
  }
  
  for (int i = 0; i < sides + 1; ++i) {
    randoms2[i] = (1 - abs((sin(((TWO_PI / sides)*i) + degreechange )))*noise(i*.01)) * topRadius;
  }
  
  for (int i = 0; i < sides + 1; ++i) {
    y1[i] = yx[i] + tall;
    y2[i] = y1[i] + tall * .2;
    yx[i+1] = y2[i];
  }
  
  
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  
  
  for (int i1 = 0; i1 < iterations + 1; ++i1) {
    
    
    beginShape(QUAD_STRIP);
    for (int i = 0; i < sides + 1; ++i) {
      vertex(randoms[i] * cos(angle), yx[i1], randoms[i] * sin(angle));
      vertex(randoms[i] * cos(angle), y1[i1], randoms[i] * sin(angle));
      angle += angleIncrement;
    }
    endShape();
    
    
    beginShape(QUAD_STRIP);
    for (int i = 0; i < sides + 1; ++i) {
      vertex(randoms[i] * cos(angle), y1[i1], randoms[i] * sin(angle));
      vertex(randoms2[i] * cos(angle), y2[i1], randoms2[i] * sin(angle));
      angle += angleIncrement;
    }
    endShape();
    
    
    
    
  }
  
}

