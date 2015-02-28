
void setup() {
  size(700, 450);
}

float tWidth = 15;
float n = 3;
float d = 20;
boolean mode = true;
boolean colMode = true;
float a, b;
float v = 20.0;
float s = 1.2;
void draw() {
  background(250);
  for (int j = 0; j < height/tWidth; j++) {
    for (int i = 0; i < width/tWidth; i++) {
      if (mode) {
        a = map(noise(i/v, 3, n), 0, 1, -d, d);
        b = map(noise(3, j/v, n), 0, 1, -d, d);
      } 
      else {
        a = map(noise(i/v, j/v, n), 0, 1, -d, d);
        b = map(noise(j/v, i/v, n), 0, 1, -d, d);
      }
      if (colMode) {    
        fill(200, 100 + 20*a, 100 + 20*b, 170);
      }
      else {
        fill(100 + 20*a, 100 + 20*b, 200, 170);
      }
      noStroke();
      beginShape();
      vertex(i*tWidth, j*tWidth + tWidth*s);
      vertex(i*tWidth + tWidth*s, j*tWidth);
      vertex(i*tWidth + a, j*tWidth + b);
      endShape();     
    }
  }
  n += 0.04;
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    mode = !mode;
  }
  else if (mouseButton == RIGHT) {
    colMode = !colMode;
  }
}

void mouseDragged() {
  v = map(mouseY, 0, height, 1.1, 60.0);
  s = map(mouseX, 0, width, 0.8, 2);
}
