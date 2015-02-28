
Wave[] waves = new Wave[10];
float cStep;
float h;

void setup() {
  size(850, 500);
  colorMode(HSB,100);
  cStep = 100/waves.length;
  h = 0;
  for(int i = 0;i<waves.length;i++){
    waves[i] = new Wave(i*50,h);
    h+=cStep;
  }
}

void draw() {
  background(0);
  for(int i = 0;i<waves.length;i++){
    waves[i].display();
  }
}

class Wave {
  int am = 19;

  float[] yPos = new float[am];
  float[] xPos = new float[am];
  float xOff;
  float x;
  float speed;
  color c;
  float h; // height
  float hue;

  Wave(float _h, float _hue) {
    xOff = 50;
    x = -xOff;
    for (int i = 0;i<yPos.length;i++) {
      yPos[i] = random(10000);
    }
    for (int i = 0;i<xPos.length;i++) {
      xPos[i] = x;
      x+=xOff;
    }
    c = color(random(255),random(255),random(255));
    h = _h;
    speed = 0.01;
    hue = _hue;
  }

  void display() {
    fill(hue,100,100);
    beginShape();
    for (int i = 0;i<yPos.length;i++) {
      float yPos2 = map(noise(yPos[i]), 0, 1, h, height);
      if (i == 1) {
        curveVertex(0, height);
      }
      else if (i == am-1) {
        curveVertex(width, height);
      }
      else {
        curveVertex(xPos[i], yPos2);
      }
      yPos[i] += speed;
    }
    curveVertex(width, height);
    endShape();
    speed = map(mouseY, 0, height, 0.001, 0.05);
  }
}

