
int s, prevSecond;
float angle, rY, rX;
float a, b, x, y;
float[] xs, ys, os;
int[] vs;
float loopScale;
boolean forward;
float n = 0.0;

void initializeVars() {
  angle = 0;
  rY = 80 * 0.5;
  rX = 220 * 0.5;
  a = 1.5;
  b = 3;
  prevSecond = 0;
  xs = new float[0];
  ys = new float[0];
  os = new float[0];
  vs = new int[0];
  loopScale = 200;
  frameRate(120);
  forward = true;
}

void setup() {
  background(0);
  size(700, 700);
  initializeVars();
  noStroke();
  smooth();
}

void drawLoop(float scale, boolean forwardVal) {
  float scaleFactor = map(scale, 0, width/2, 2.5, 0.8);

  if (forwardVal) {
    angle += 1 * scaleFactor;//1 + (1/scale)/100;//(1 + scale/100); //3
  } 
  else {
    angle -= 1 * scaleFactor;//1 + (1/scale)/100;//(1 + scale/100); //3
  }
  pushMatrix();
  translate(width/2, height/2);
  x = rX * sin(radians(a*angle)) * (scale*0.01);
  y = rY * sin(radians(b*angle)) * (scale*0.01);
  float colorMap1 = map(abs(x), 0, rX, 0, 255);
  float colorMap2 = map(abs(y), 0, rY, 0, 255);
  fill(255, colorMap1, colorMap1);
  ellipse(x, y, abs(x)*0.05 + 3, abs(x)*0.05 + 3);
  popMatrix();
}

void refreshBackground() {
  fill(0, 10);
  rect(0, 0, width, height);
}

void drawTraces() {
  for (int i = 0; i < vs.length; i++) {
    float opacity = random(1);
    os[i] -= opacity;
    if (os[i] < 10) {
      vs[i] = 1;
    }
    if (vs[i] == 0) {
      pushMatrix();
      translate(width/2, height/2);
      fill(255, os[i]);
      ellipse(xs[i], ys[i], 1, 1);
      popMatrix();
    }
  }
}

void updateTraces() {
  pushMatrix();
  translate(width/2, height/2);
  xs = append(xs, x);
  ys = append(ys, y);
  os = append(os, random(255));
  vs = append(vs, 0);
  popMatrix();
}

void draw() {
  drawTraces();
  refreshBackground();
  drawLoop(loopScale, forward);

  s = second();
  if (prevSecond != s) {
    loopScale = map(noise(n), 0, 1, 0, width/2);
    prevSecond = s;
  }

  n += 0.01;

  if (keyPressed) {
    updateTraces();
  }

  if (mousePressed) {
    loopScale = abs(mouseX - width/2);
    updateTraces();
    if (mouseX < width/2) {
      forward = false;
    } 
    else {
      forward = true;
    }
  }
}
