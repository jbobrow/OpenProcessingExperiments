
float x = 0;
float y = 0;
float q = 0;
float z = 0;
float s = 0;
float r = 0;
float w = 0;
float n = 0;
float t = 0;
float p = 0;

PFont font;
float h = 800;

float[] Xcoord = new float [5];
float[] Ycoord = new float [5];
float[] yMove = new float [5];

float[] Mcoord = new float[10];
float[] Ncoord = new float [10];
float[] mMove = new float[10];
float[] nMove = new float[10];

float[] XCoords = new float[500];
float[] YCoords = new float[500];

void setup() {
  size (800, 600);
  smooth();
  noCursor();
  background(255);
  font = loadFont("BankGothic-Medium-48.vlw");
    textFont(font, 60);

  for (int i = 0; i < 5; i++) {
    Xcoord[i] = i*150+100;
    Ycoord[i] = 0;
    yMove[i] = random(.5, 1);
  }
  for (int i = 0; i < 10; i++) {
    Mcoord[i] = i*100;
    Ncoord[i] = 0;
    nMove[i] = random(1, 1.5);
  }
  for (int i = 0; i < 500; i++) {
    XCoords[i] = random(width);
    YCoords[i] = random(height);
  }
}

void draw() {
  background(0);
  fill(0, 20);

  stroke(255);
  for (int i = 0; i < 500; i++) {
    point(XCoords[i], YCoords[i]);
    YCoords[i]++;
    if (YCoords[i] > height) {
      YCoords[i] = 0;
    }
  }

  drawEarth(400, 800);
  fill(255,0,0);
  text("WARNING", h, 100);
  h--;
  if (h < -330) {
    h = 800;
  }

  for (int i=0;i<5;i++) {
    drawAlien(Xcoord[i], Ycoord[i] * 2);
    Ycoord[i] += yMove[i];
    if (hitTest(Xcoord[i], Ycoord[i] * 2) && mousePressed) {
      Ycoord[i] = -100;
    }
  }
  r++;

  for (int i=0;i<10;i++) {
    drawAstoroid(Mcoord[i], Ncoord[i] * 2);
    Ncoord[i] += nMove[i];
    if (hitTest(Mcoord[i], Ncoord[i] * 2) && mousePressed) {
      Ncoord[i] = -100;
    }
    Mcoord[i] += random(-2, 2);
  }
  r++;

  if (mousePressed) {
    stroke(255, 0, 0);
    drawLaser(mouseX, mouseY);
  }

  drawCrosshair(mouseX, mouseY);
}

void drawCrosshair(float x, float y) {
  fill(0, 0, 255, 30);
  stroke(255);
  ellipse(mouseX, mouseY, 60, 60);
  fill(0, 255, 0, 30);
  rect(mouseX - 10, mouseY - 10, 20, 20);
  line (mouseX, mouseY - 15, mouseX, mouseY + 15);
  line (mouseX - 15, mouseY, mouseX + 15, mouseY);
}

void drawLaser(float q, float z) {
  line (0, 600, mouseX, mouseY);
  line (800, 600, mouseX, mouseY);
}

void drawAlien(float s, float r) {
  stroke(0);
  fill(0, 255, 0);
  ellipse (s, r-20, 50, 50);
  fill(0);
  triangle (s, r, s-20, r-30, s+20, r-30);
}

void drawAstoroid(float t, float p) {
  fill(134, 1, 10);
  beginShape();
  vertex(t, p);
  vertex(t + 30, p);
  vertex(t + 40, p - 20);
  vertex(t + 30, p - 30);
  vertex(t, p - 40);
  vertex(t - 20, p - 20);
  endShape();
}

void drawEarth(float w, float n) {
  fill(0, 0, 255);
  stroke(0);
  ellipse(w, n, 1200, 600);
}

boolean hitTest(float s, float r) {
  if (dist(mouseX, mouseY, s, r) < 30) {
    return true;
  } 
  else return false;
}


